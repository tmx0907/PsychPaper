-- ============================================================
-- 00_init.sql — Extension + ENUM 타입
-- 다른 모든 파일보다 먼저 실행되어야 함
-- ============================================================

-- UUID 자동 생성을 위한 확장
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 아티클 본문 유형: 일반 마크다운 vs Deep Dive HTML
CREATE TYPE content_type AS ENUM ('markdown', 'html');

-- 아티클 상태: 초안 vs 발행
CREATE TYPE article_status AS ENUM ('draft', 'published');

-- PARS 카테고리 축: 현상 / 응용 / 연구유형 / 규모
CREATE TYPE pars_axis AS ENUM ('phenomenon', 'application', 'research_type', 'scale');
