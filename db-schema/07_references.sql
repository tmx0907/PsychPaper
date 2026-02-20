-- ============================================================
-- 07_references.sql — 논문 출처
-- 의존: 04_articles.sql
-- 관계: articles(1) → references(N)
-- 참고: "references"는 PostgreSQL 예약어 → 큰따옴표 필수
-- ============================================================

CREATE TABLE "references" (
    id              SERIAL          PRIMARY KEY,
    article_id      UUID            NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
    authors         VARCHAR(1000)   NOT NULL DEFAULT '',     -- 예: 'Cappuccio FP, D''Elia L, ...'
    year            INTEGER         DEFAULT NULL,            -- 출판 연도
    title           VARCHAR(1000)   NOT NULL DEFAULT '',     -- 논문 제목
    journal         VARCHAR(500)    DEFAULT '',              -- 저널명
    doi             VARCHAR(255)    DEFAULT '',              -- DOI
    sort_order      INTEGER         NOT NULL DEFAULT 0       -- 출처 표시 순서
);

COMMENT ON TABLE "references" IS '아티클에 인용된 논문 출처. 1:N 관계';
