-- ============================================================
-- 08_comments.sql — 독자 댓글 (Admin 승인제)
-- 의존: 04_articles.sql
-- 관계: articles(1) → comments(N)
--       comments(1) → comments(N) : 자기참조 (대댓글)
-- ============================================================
-- 보안 전략 (4층 방어):
--   1층: XSS 새니타이즈 + SQL Injection 방어 (ORM)
--   2층: Rate Limiting (1분 2회) + Honeypot 필드
--   3층: 금지어 필터 + 닉네임 예약어 차단
--   4층: Admin 승인 전 비공개 (is_approved)
--
-- MVP에서 제외된 기능:
--   - 독자 댓글 수정 (인증 없이 안전하게 구현 불가)
--   - 독자 댓글 삭제 (인증 없이 안전하게 구현 불가)
--   → Admin만 삭제 가능 (소프트 삭제)
-- ============================================================

CREATE TABLE comments (
    id              SERIAL          PRIMARY KEY,
    article_id      UUID            NOT NULL REFERENCES articles(id) ON DELETE CASCADE,
    parent_id       INTEGER         DEFAULT NULL REFERENCES comments(id) ON DELETE CASCADE,
                                    -- NULL = 최상위 댓글, 값 있으면 = 대댓글 (1 depth)
    nickname        VARCHAR(50)     NOT NULL,                -- 닉네임 (로그인 없이 자유 입력)
    content         TEXT            NOT NULL,                -- 댓글 내용 (서버에서 XSS 새니타이즈 필수)
    ip_address      VARCHAR(45)     DEFAULT NULL,            -- 스팸 IP 차단용 (IPv6 대응: 45자)
    is_approved     BOOLEAN         NOT NULL DEFAULT FALSE,  -- Admin 승인 전엔 독자에게 안 보임
    approved_at     TIMESTAMP       DEFAULT NULL,            -- Admin 승인 시각
    is_deleted      BOOLEAN         NOT NULL DEFAULT FALSE,  -- 소프트 삭제 (실수 복구 가능)
    created_at      TIMESTAMP       NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE comments IS '독자 댓글. Admin 승인제: is_approved=true만 공개';
COMMENT ON COLUMN comments.parent_id IS 'NULL=최상위 댓글, 값=대댓글. MVP에서 1 depth만';
COMMENT ON COLUMN comments.is_approved IS 'false=비공개. Admin 승인 후 true로 변경';
COMMENT ON COLUMN comments.ip_address IS '스팸 추적용. 서버에서 req.ip로 수집';
