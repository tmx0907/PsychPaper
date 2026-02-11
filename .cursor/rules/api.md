# API 스펙 (REST)

## Public (인증 불필요)

| Method | Endpoint | 설명 |
|--------|----------|------|
| GET | `/api/articles` | 목록 (페이지네이션, 필터) |
| GET | `/api/articles/:slug` | 상세 (조회수 +1) |
| GET | `/api/articles/search?q=` | 키워드 검색 |
| GET | `/api/categories` | 전체 카테고리 |
| GET | `/api/categories/:axis` | PARS 축별 카테고리 |
| GET | `/api/categories/:slug/articles` | 카테고리별 아티클 |
| GET | `/api/tags/:slug/articles` | 태그별 아티클 |
| GET | `/api/articles/:slug/comments` | 댓글 목록 |
| POST | `/api/articles/:slug/comments` | 댓글 작성 |

## Admin (JWT 필요)

| Method | Endpoint | 설명 |
|--------|----------|------|
| POST | `/api/admin/login` | 로그인 → JWT 발급 |
| POST | `/api/admin/articles` | 아티클 생성 |
| PUT | `/api/admin/articles/:id` | 아티클 수정 |
| DELETE | `/api/admin/articles/:id` | 소프트 삭제 |
| DELETE | `/api/admin/comments/:id` | 댓글 삭제 |
| GET | `/api/admin/comments` | 전체 댓글 관리 |

## 공통

- 응답: JSON
- 인증: `Authorization: Bearer <JWT>` (Admin만)
- OG 메타태그: SSR 또는 프리렌더링으로 아티클별 og:title, og:description, og:image, og:url 제공 필요
