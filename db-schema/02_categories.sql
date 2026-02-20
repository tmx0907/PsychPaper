-- ============================================================
-- 02_categories.sql — PARS 카테고리 마스터
-- 의존: 00_init.sql (pars_axis ENUM)
-- 관계: article_categories를 통해 articles와 N:M
-- ============================================================

CREATE TABLE categories (
    id              SERIAL          PRIMARY KEY,
    axis            pars_axis       NOT NULL,           -- P / A / R / S 구분
    name            VARCHAR(100)    NOT NULL,           -- 예: '수면 & 각성'
    slug            VARCHAR(100)    NOT NULL UNIQUE,    -- URL용: 'sleep-and-arousal'
    icon            VARCHAR(10)     DEFAULT '',         -- 이모지: '🌙'
    description     TEXT            DEFAULT '',         -- 카테고리 설명
    sort_order      INTEGER         NOT NULL DEFAULT 0  -- 표시 순서
);

COMMENT ON TABLE categories IS 'PARS 분류 체계의 카테고리. axis로 4개 축 구분';
