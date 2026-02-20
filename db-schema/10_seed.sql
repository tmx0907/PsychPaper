-- ============================================================
-- 10_seed.sql — 초기 데이터
-- 의존: 02_categories.sql, 01_admin_users.sql
-- ============================================================

-- ── P (Phenomenon · 현상) — 8개 ──
INSERT INTO categories (axis, name, slug, icon, description, sort_order) VALUES
('phenomenon', '수면 & 각성',     'sleep-and-arousal',     '🌙', '수면 부족, 불면증, 생체리듬, 수면 위생',              1),
('phenomenon', '정서 & 기분',     'emotion-and-mood',      '💭', '우울, 불안, 감정 조절, 정서 발달',                   2),
('phenomenon', '인지 & 학습',     'cognition-and-learning', '🧠', '기억, 주의력, 의사결정, 메타인지',                   3),
('phenomenon', '관계 & 사회',     'relationships-social',   '🤝', '애착, 사회적 인지, 집단 역학',                       4),
('phenomenon', '스트레스 & 대처', 'stress-and-coping',      '🔥', '번아웃, 트라우마, 회복탄력성, PTSD',                 5),
('phenomenon', '동기 & 행동',     'motivation-behavior',    '⚡', '습관, 중독, 자기통제, 동기부여',                     6),
('phenomenon', '발달 & 노화',     'development-aging',      '🌱', '아동 발달, 청소년기, 인지 노화',                     7),
('phenomenon', '성격 & 개인차',   'personality',            '🎭', 'Big Five, 기질, 성격 장애, 개인차',                  8);

-- ── A (Application · 응용) — 6개 ──
INSERT INTO categories (axis, name, slug, icon, description, sort_order) VALUES
('application', '학습 & 교육',    'learning-education',     '📚', '시험 전략, 학습법, 학업 성취, 교육 심리',             1),
('application', '직장 & 생산성',  'work-productivity',      '💼', '번아웃 예방, 의사결정, 리더십, 조직 심리',            2),
('application', '건강 & 웰빙',    'health-wellbeing',       '❤️', '수면 위생, 운동과 정신건강, 식습관, 마음챙김',        3),
('application', '관계 & 소통',    'relationships-comm',     '💑', '연애, 우정, 갈등 해결, 의사소통',                    4),
('application', '육아 & 발달',    'parenting',              '👶', '아이 교육, 청소년 이해, 양육 방식',                  5),
('application', '자기이해',       'self-understanding',     '🪞', '성격 검사, 자기인식, 마인드셋, 자아정체성',           6);

-- ── R (Research Type · 연구유형) — 6개 ──
INSERT INTO categories (axis, name, slug, icon, description, sort_order) VALUES
('research_type', '메타분석',         'meta-analysis',     '📊', '여러 연구를 통합 분석. 가장 높은 근거 수준',         1),
('research_type', '체계적 문헌고찰',  'systematic-review', '📋', '기존 연구를 체계적으로 정리·평가',                   2),
('research_type', 'RCT',             'rct',               '🔬', '무작위 대조 실험. 인과관계 추론에 강함',             3),
('research_type', '종단 연구',       'longitudinal',      '📈', '장기간 추적 관찰',                                  4),
('research_type', '횡단 연구',       'cross-sectional',   '📐', '한 시점 측정',                                      5),
('research_type', '질적 연구',       'qualitative',       '🗣️', '인터뷰, 사례 연구, 현상학적 분석',                  6);

-- ── S (Scale · 규모) — 4개 ──
INSERT INTO categories (axis, name, slug, icon, description, sort_order) VALUES
('scale', '소규모',   'small-scale',   '🔬', '참가자 100명 미만',          1),
('scale', '중규모',   'medium-scale',  '📊', '참가자 100~1,000명',         2),
('scale', '대규모',   'large-scale',   '📈', '참가자 1,000~100,000명',     3),
('scale', '메가',     'mega-scale',    '🌍', '참가자 100,000명 이상',      4);

-- ── Admin 계정 ──
-- ⚠️ 비밀번호는 플레이스홀더! 서버 첫 실행 시 bcrypt 해시로 교체 필요
INSERT INTO admin_users (username, password_hash) VALUES
('admin', '$2b$10$PLACEHOLDER_HASH_CHANGE_ME_ON_FIRST_LOGIN');
