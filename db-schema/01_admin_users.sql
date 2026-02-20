-- ============================================================
-- 01_admin_users.sql — 관리자 계정
-- 의존: 00_init.sql
-- 관계: 독립 (다른 테이블과 FK 없음)
-- ============================================================

CREATE TABLE admin_users (
    id              SERIAL          PRIMARY KEY,
    username        VARCHAR(50)     NOT NULL UNIQUE,
    password_hash   VARCHAR(255)    NOT NULL,           -- bcrypt 해시. 평문 저장 금지
    created_at      TIMESTAMP       NOT NULL DEFAULT NOW()
);

COMMENT ON TABLE admin_users IS '관리자 계정. MVP에서는 1인만 사용';
