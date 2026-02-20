PsychPaper PRD (Product Requirements Document)
1. 프로젝트 개요
제품명
PsychPaper - 심리학 논문 해설 & 지식 탐색 플랫폼
핵심 가치
복잡한 심리학 논문을 일반인도 이해할 수 있게 해설
PARS 카테고리로 체계적인 지식 탐색 제공
1인 운영 블로그 형태의 간단한 구조
2. 현재 구현 완료 기능
2.1 기술 스택
영역
기술
Frontend
React 18, React Router, Tailwind CSS
Backend
Node.js + Express
Database
PostgreSQL (스키마 설계 완료)
컨테이너
Docker + Docker Compose

2.2 구현된 핵심 기능
A. 아티클 시스템
Markdown 아티클: 일반 블로그 글 형태
Deep Dive HTML: 논문 해설용 풍부한 콘텐츠
아티클 목록 및 상세 페이지 (iframe 렌더링)
B. PARS 카테고리 탐색
Perception (지각): 감각, 인지적 지각
Action (행동): 의사결정, 학습, 동기
Relation (관계): 사회심리, 집단역학
Self (자아): 정체성, 개성, 발달
C. UI/UX 시스템
다크 테마 기본 (Tailwind CSS)
반응형 디자인
Hero 섹션, 카드 레이아웃
디자인 레퍼런스: docs/design-reference.html
D. 데이터베이스 스키마
sql
- articles (id, title, content, type, category, created_at 등)
- comments (id, article_id, author, content, password 등)  
- article_tags (다대다 관계)
E. 개발 환경
로컬 개발: npm run dev
Docker 통합: docker-compose up --build
브라우저 접속: http://localhost:8080
3. 미구현 기능 (향후 개발 예정)
3.1 사용자 인터랙션
 댓글 시스템: 닉네임·비밀번호 선택 방식
 SNS 공유: 페이스북, 트위터, 카카오톡
 OG 메타태그: 동적 생성으로 SNS 미리보기
3.2 관리 기능
 JWT 기반 Admin 로그인
 아티클 작성/수정 인터페이스


4. 사용자 정의
타겟 사용자
유형
설명
권한
Admin
작성자 (1명)
아티클 작성/관리
Reader
독자 (다수)
비로그인 읽기, 댓글 작성 예정

MVP 범위
현재는 읽기 전용 블로그로 구현 완료
아티클 조회 ✅
PARS 카테고리 탐색 ✅
반응형 다크 테마 UI ✅
5. 개발 우선순위
Phase 1 (완료)
✅ 기본 아키텍처 구축
✅ 아티클 조회 시스템
✅ PARS 카테고리 구조
✅ UI/UX 기본 틀
Phase 2 (다음 개발)
댓글 시스템 구현
SNS 공유 기능
OG 메타태그 동적 생성
Phase 3 (향후)
Admin 로그인 시스템
아티클 관리 인터페이스


