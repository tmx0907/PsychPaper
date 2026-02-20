-- ============================================================
-- 05_article_categories.sql — 아티클 ↔ 카테고리 (N:M)
-- 의존: 04_articles.sql, 02_categories.sql
-- 하나의 아티클이 여러 PARS 카테고리에 속할 수 있음
-- 예: '수면 부족 Deep Dive' → 수면&각성(P) + 인지&학습(P) + 메타분석(R) + 메가(S)
-- ============================================================

CREATE TABLE article_categories (
    article_id      UUID            NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
    category_id     INTEGER         NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (article_id, category_id)   -- 복합 PK: 같은 조합 중복 방지
);

COMMENT ON TABLE article_categories IS '아티클↔카테고리 다대다(N:M) 연결 테이블';
