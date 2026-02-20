-- ============================================================
-- run_all.sql — 전체 스키마를 순서대로 실행
-- 사용법: psql -U postgres -d psychpaper -f run_all.sql
-- ============================================================

\echo '>> 00. Extension + ENUM ...'
\i 00_init.sql

\echo '>> 01. admin_users ...'
\i 01_admin_users.sql

\echo '>> 02. categories ...'
\i 02_categories.sql

\echo '>> 03. tags ...'
\i 03_tags.sql

\echo '>> 04. articles ...'
\i 04_articles.sql

\echo '>> 05. article_categories ...'
\i 05_article_categories.sql

\echo '>> 06. article_tags ...'
\i 06_article_tags.sql

\echo '>> 07. references ...'
\i 07_references.sql

\echo '>> 08. comments ...'
\i 08_comments.sql

\echo '>> 09. indexes ...'
\i 09_indexes.sql

\echo '>> 10. seed data ...'
\i 10_seed.sql

\echo ''
\echo '✅ PsychPaper DB schema 생성 완료!'
\echo '   테이블 8개 + 인덱스 9개 + 시드 데이터 (카테고리 24개, Admin 1명)'
\echo ''
