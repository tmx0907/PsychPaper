# 데이터베이스 (PostgreSQL)

## 주요 테이블 요약

- **articles**: slug(unique), title, subtitle, summary, content_type(markdown|html), content, thumbnail_url, read_time_min, view_count, status(draft|published), is_deleted, created_at, updated_at, published_at
- **categories**: axis(phenomenon|application|research_type|scale), name, slug, icon, description, sort_order
- **article_categories**: article_id (FK), category_id (FK) — N:N
- **tags**, **article_tags**: 자유 태그 및 아티클-태그 N:N
- **references**: article_id, authors, year, title, journal, doi, sort_order
- **comments**: article_id, parent_id(대댓글), nickname, password_hash(선택), content, is_deleted, created_at
- **admin_users**: username, password_hash

## 규칙

- 아티클 **slug**는 URL용이므로 unique 제약 필수. 중복 시 자동 보정(slug-2 등) 또는 에러 처리 정책 결정.
- **소프트 삭제**: articles, comments는 is_deleted 플래그 사용. 실제 DELETE 사용하지 않음.
- **Scale 저장**: scale 축은 라벨(소규모/중규모/대규모/메가) + 필요 시 participant_count 등 보조 필드로 저장. PRD 8장 참고.

## 시드 데이터

- PARS categories는 axis별로 시드 데이터 입력 (Phase 1). 이름·slug·icon·sort_order 정의.
