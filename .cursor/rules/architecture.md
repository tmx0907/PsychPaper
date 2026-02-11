# 시스템 아키텍처

## 기술 스택

- **Frontend**: React 18, Vite, React Router, Tailwind CSS, react-markdown + remark-gfm, rehype-highlight
- **Backend**: Node.js, Express, JWT (jsonwebtoken)
- **Database**: PostgreSQL
- **ORM**: Prisma 또는 Knex.js
- **이미지 (MVP)**: Multer + 로컬 스토리지
- **환경**: 웹은 로컬(npm run dev) 또는 Docker. docker-compose up 시 web(8080) + server(3000) + db(5432) 모두 실행.

## 구조

```
Web (React SPA) — 로컬 실행, 컨테이너 없음
  ↕ REST API (JSON) — /api 프록시 → localhost:3000
Server (Express) — Docker 또는 로컬
  ↕
PostgreSQL — Docker
```

## 프로젝트 구조

```
/web                  # React (Vite). Docker 없음, 로컬에서 npm run dev
  package.json
  vite.config.ts
  src/
server/               # Express (TS). Dockerfile 있음
  package.json
  src/index.ts
  Dockerfile
  uploads/
docker-compose.yml    # web(8080) + server(3000) + db(5432). PsychPaper는 http://localhost:8080
.env
.env.example
.gitignore
```

## 라우팅 (React)

- `/` — 홈 (PARS 카드 그리드)
- `/explore` — 전체 아티클 (검색·필터)
- `/category/:slug` — 카테고리별 아티클
- `/article/:slug` — 아티클 읽기
- `/tag/:tag` — 태그별 아티클
- `/admin`, `/admin/write`, `/admin/comments` — 관리자
