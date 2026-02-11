# 배포

## 환경

- Docker Desktop 로컬 개발: docker-compose로 React + Express + PostgreSQL 통합
- 프로덕션 빌드: Docker 이미지 또는 정적 빌드(client) + Node 서버(server)

## 배포 대상 (PRD)

- Frontend: Vercel 등 정적/SSR 호스팅
- Backend: Railway 또는 VPS
- DB: PostgreSQL (Railway, Supabase, RDS 등)

## CI/CD (향후)

- PR 시 lint + 단위 테스트
- main 브랜치 푸시 시 빌드·배포 파이프라인

## OG 메타태그

- SPA만 사용 시 SNS 크롤러가 메타를 읽지 못할 수 있음. SSR 또는 OG 전용 라우트/서비스로 og:title, og:description, og:image, og:url 제공 필요.
