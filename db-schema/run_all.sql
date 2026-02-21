-- ============================================================
-- run_all.sql — MVP 스키마를 순서대로 실행
-- 사용법: psql -U postgres -d psychpaper -f run_all.sql
-- ============================================================

\echo '>> 00. Extension + ENUM ...'
\i 00_init.sql

\echo '>> 01. admin_users ...'
\i 01_admin_users.sql

\echo '>> 02. categories ...'
\i 02_categories.sql

\echo '>> 04. articles ...'
\i 04_articles.sql

\echo '>> 08. comments ...'
\i 08_comments.sql

\echo ''
\echo '✅ PsychPaper DB schema (MVP) 생성 완료!'
\echo '   테이블: admin_users, categories, articles, comments'
\echo ''
