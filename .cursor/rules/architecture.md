# 시스템 아키텍처

## 기술 스택

- **Frontend**: React 18, React Router, Tailwind CSS, react-markdown + remark-gfm, rehype-highlight
- **Backend**: Node.js, Express, JWT (jsonwebtoken)
- **Database**: PostgreSQL
- **ORM**: Prisma 또는 Knex.js
- **이미지 (MVP)**: Multer + 로컬 스토리지
- **환경**: Docker Desktop (docker-compose)

## 구조

```
Client (React SPA)
  ↕ REST API (JSON)
Server (Express)
  ↕
PostgreSQL
```

## 프로젝트 구조 (예시)

```
client/                 # React 프론트엔드
├── src/
│   ├── components/     # Layout, Header, Footer, 카드, 뱃지, 에디터 등
│   ├── pages/          # 홈, explore, category, article, admin
│   ├── hooks/
│   ├── api/            # API 클라이언트
│   └── styles/
server/                 # Express 백엔드
├── src/
│   ├── routes/         # articles, categories, tags, comments, admin
│   ├── middleware/     # auth, error
│   ├── services/
│   └── db/             # Prisma/Knex
├── uploads/            # 이미지 (MVP 로컬)
docker-compose.yml
```

## 라우팅 (React)

- `/` — 홈 (PARS 카드 그리드)
- `/explore` — 전체 아티클 (검색·필터)
- `/category/:slug` — 카테고리별 아티클
- `/article/:slug` — 아티클 읽기
- `/tag/:tag` — 태그별 아티클
- `/admin`, `/admin/write`, `/admin/comments` — 관리자
