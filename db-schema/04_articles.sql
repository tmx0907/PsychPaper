-- ============================================================
-- 04_articles.sql — 아티클 본체 (핵심 테이블)
-- 의존: 00_init.sql (content_type, article_status ENUM)
-- 관계: 1:N → comments, references
--       N:M → categories (via 05), tags (via 06)
-- ============================================================

CREATE TABLE articles (
    id              UUID            PRIMARY KEY DEFAULT uuid_generate_v4(),
    slug            VARCHAR(255)    NOT NULL UNIQUE,         -- URL: /article/sleep-deprivation-deep-dive
    title           VARCHAR(500)    NOT NULL,                -- 제목
    subtitle        VARCHAR(500)    DEFAULT '',              -- 부제목
    summary         TEXT            DEFAULT '',              -- SNS 공유용 요약 (280자 권장)
    content_type    content_type    NOT NULL DEFAULT 'markdown',
    content         TEXT            NOT NULL DEFAULT '',     -- 본문 (Markdown 또는 HTML)
    thumbnail_url   VARCHAR(1000)   DEFAULT '',              -- 대표 이미지 URL
    read_time_min   INTEGER         NOT NULL DEFAULT 1,      -- 읽기 예상 시간 (분)
    view_count      INTEGER         NOT NULL DEFAULT 0,      -- 조회수
    status          article_status  NOT NULL DEFAULT 'draft',
    is_deleted      BOOLEAN         NOT NULL DEFAULT FALSE,  -- 소프트 삭제
    created_at      TIMESTAMP       NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMP       NOT NULL DEFAULT NOW(),
    published_at    TIMESTAMP       DEFAULT NULL             -- 발행 전에는 NULL
);

COMMENT ON TABLE articles IS '아티클 본체. Markdown 글과 Deep Dive HTML 글 모두 저장';
COMMENT ON COLUMN articles.id IS 'UUID — SNS 공유 시 글 순서 노출 방지';
COMMENT ON COLUMN articles.slug IS 'URL용 고유 문자열. 사람이 읽을 수 있는 형태';
COMMENT ON COLUMN articles.is_deleted IS '소프트 삭제. true면 조회에서 제외하되 DB에는 보존';
