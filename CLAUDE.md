# CLAUDE.md

**PsychPaper** — 심리학 논문 해설 & 지식 탐색 플랫폼 (논문 해설 블로그 + PARS 카테고리 탐색)

## 핵심 컨텍스트

- **Frontend**: React 18, React Router, Tailwind CSS (다크 테마 기본)
- **Backend**: Node.js + Express, JWT(Admin), PostgreSQL
- **주요 기능**: PARS 카테고리 탐색, Markdown/Deep Dive HTML 아티클, 댓글(닉네임·비밀번호 선택), SNS 공유·OG 메타태그
- **대상**: 작성자 1인(Admin) + 독자 다수(비로그인 MVP)

## 규칙 파일

`.cursor/rules/` 참조:

| 파일 | 내용 |
|------|------|
| `project.md` | 프로젝트 개요, 사용자, PARS 개념 |
| `architecture.md` | 기술 스택, 폴더 구조 |
| `database.md` | PostgreSQL 스키마 요약 |
| `api.md` | REST API 엔드포인트 |
| `ui.md` | 디자인 시스템, 컴포넌트, 다크 테마 |
| `pars.md` | PARS 카테고리 체계·태그 규칙 |
| `technical.md` | 코드 스타일, 네이밍, 에러 처리 |
| `security.md` | JWT, 댓글, HTML sanitize |
| `testing.md` | 테스트 전략 |
| `deploy.md` | Docker, 배포 환경 |

**디자인 시각 레퍼런스:** `docs/design-reference.html` — 브라우저로 열어 Hero, 카드, PARS, 테이블 등 전체 UI 확인용.

## 자주 쓰는 명령어

```bash
# 웹 (로컬만, 컨테이너 없음)
cd web && npm install && npm run dev

# 서버 (로컬)
cd server && npm install && npm run dev

# 전체 (웹 + 서버 + DB) Docker로 한 번에
docker-compose up --build
# → 브라우저에서 http://localhost:8080 으로 PsychPaper 접속

# DB 마이그레이션 (Prisma 도입 후)
cd server && npx prisma migrate dev
```

## 기본 규칙 (작업 시)

- **설명**: 항상 한국어로, 왜 바꾸는지 먼저 말하고 간단한 말로 설명하기
- **계획**: 코드 전에 1단계·2단계 계획 먼저
- **결과**: 데이터/옵션은 표로 정리해서 보여주기
- **확인**: 중요한 변경 전에 사용자에게 확인받기
