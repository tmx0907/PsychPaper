-- ============================================================
-- 03_tags.sql — 자유 태그 마스터
-- 의존: 없음
-- 관계: article_tags를 통해 articles와 N:M
-- ============================================================

CREATE TABLE tags (
    id              SERIAL          PRIMARY KEY,
    name            VARCHAR(100)    NOT NULL UNIQUE,    -- 예: 'Cappuccio'
    slug            VARCHAR(100)    NOT NULL UNIQUE     -- URL용: 'cappuccio'
);

COMMENT ON TABLE tags IS '자유 태그. 논문 저자명, 키워드 등';
