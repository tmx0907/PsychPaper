# PsychPaper DB Schema — 파일 구조

## 왜 파일을 나눴나?

하나의 거대한 SQL 파일은:
- Cursor에서 컨텍스트가 너무 커서 AI가 맥락을 놓침
- 특정 테이블만 수정하고 싶을 때 찾기 어려움
- 팀원이 어떤 테이블이 있는지 파악하기 어려움

역할별로 나누면:
- "comments 테이블 수정해줘" → `08_comments.sql`만 열면 됨
- 에러나면 어디서 터졌는지 바로 알 수 있음
- Git에서 변경 이력 추적이 깔끔함

## 파일 구조

```
db-schema/
├── README.md              ← 지금 읽고 있는 파일
├── 00_init.sql            ← Extension + ENUM 타입 (가장 먼저 실행)
├── 01_admin_users.sql     ← 관리자 계정 테이블
├── 02_categories.sql      ← PARS 카테고리 테이블
├── 03_tags.sql            ← 자유 태그 테이블
├── 04_articles.sql        ← 아티클 테이블 (핵심)
├── 05_article_categories.sql ← 아티클↔카테고리 연결 (N:M)
├── 06_article_tags.sql    ← 아티클↔태그 연결 (N:M)
├── 07_references.sql      ← 논문 출처 테이블
├── 08_comments.sql        ← 댓글 테이블 (Admin 승인제)
├── 09_indexes.sql         ← 인덱스 모음
├── 10_seed.sql            ← 초기 데이터 (PARS 카테고리 + Admin 계정)
└── run_all.sql            ← 전체를 순서대로 실행하는 스크립트
```

## 실행 방법

### 방법 1: 전체 한 번에 실행
```bash
psql -U postgres -d psychpaper -f run_all.sql
```

### 방법 2: 개별 파일 실행 (디버깅 시)
```bash
psql -U postgres -d psychpaper -f 00_init.sql
psql -U postgres -d psychpaper -f 01_admin_users.sql
# ... 순서대로
```

### 방법 3: Docker 초기화
`docker-compose.yml`에서 **번호 붙은 파일만** 마운트하면 컨테이너 기동 시 자동 실행됩니다:
```yaml
services:
  db:
    image: postgres:16
    volumes:
      - ./db-schema:/docker-entrypoint-initdb.d
```
PostgreSQL은 `/docker-entrypoint-initdb.d/` 안의 `.sql`을 **알파벳 순서**로 실행하므로 `00_`~`10_` 순서가 지켜집니다.  
⚠️ `run_all.sql`까지 넣으면 00~10 실행 뒤 한 번 더 실행되어 중복 오류가 날 수 있으므로, Docker용으로는 `00_init.sql`~`10_seed.sql`만 두거나 해당 디렉터리만 마운트하세요.

## 번호 규칙

| 번호 | 역할 | 의존성 |
|------|------|--------|
| 00 | 기반 (Extension, ENUM) | 없음 |
| 01~03 | 독립 테이블 | 00에만 의존 |
| 04 | 핵심 테이블 (articles) | 00에 의존 |
| 05~08 | 종속/연결 테이블 | 04에 의존 |
| 09 | 인덱스 | 모든 테이블에 의존 |
| 10 | 시드 데이터 | 모든 테이블에 의존 |
