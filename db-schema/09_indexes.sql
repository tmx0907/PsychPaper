-- ============================================================
-- 09_indexes.sql — 인덱스 모음
-- 의존: 모든 테이블 (01~08)
-- ============================================================
-- 인덱스 = 책의 "색인". 자주 검색하는 컬럼에 만들면 조회 속도 ↑
-- UNIQUE 제약 (slug 등)은 자동으로 인덱스가 생김 → 별도 생성 불필요
-- ============================================================

-- articles: 발행 글 최신순 조회 (가장 자주 쓰는 쿼리)
CREATE INDEX idx_articles_status_published
    ON articles (status, published_at DESC)
    WHERE is_deleted = FALSE;

-- articles: 인기순 정렬
CREATE INDEX idx_articles_view_count
    ON articles (view_count DESC)
    WHERE is_deleted = FALSE AND status = 'published';

-- categories: PARS 축별 조회 + 정렬
CREATE INDEX idx_categories_axis_sort
    ON categories (axis, sort_order);

-- article_categories: 카테고리별 아티클 조회
CREATE INDEX idx_article_categories_category
    ON article_categories (category_id);

-- article_tags: 태그별 아티클 조회
CREATE INDEX idx_article_tags_tag
    ON article_tags (tag_id);

-- references: 아티클별 출처 조회
CREATE INDEX idx_references_article
    ON "references" (article_id, sort_order);

-- comments: 독자용 — 승인된 댓글만 조회
CREATE INDEX idx_comments_article_approved
    ON comments (article_id, created_at)
    WHERE is_approved = TRUE AND is_deleted = FALSE;

-- comments: Admin용 — 승인 대기 목록
CREATE INDEX idx_comments_pending
    ON comments (created_at)
    WHERE is_approved = FALSE AND is_deleted = FALSE;

-- comments: 대댓글 조회
CREATE INDEX idx_comments_parent
    ON comments (parent_id)
    WHERE parent_id IS NOT NULL AND is_deleted = FALSE;
