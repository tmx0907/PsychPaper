-- ============================================================
-- 06_article_tags.sql — 아티클 ↔ 태그 (N:M)
-- 의존: 04_articles.sql, 03_tags.sql
-- ============================================================

CREATE TABLE article_tags (
    article_id      UUID            NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
    tag_id          INTEGER         NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (article_id, tag_id)
);

COMMENT ON TABLE article_tags IS '아티클↔태그 다대다(N:M) 연결 테이블';
