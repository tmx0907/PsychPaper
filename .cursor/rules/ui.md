# UI/UX 디자인 시스템

**참조:** PRD 11장 및 Deep Dive HTML 계승.  
**상세 레이아웃·컴포넌트 시각:** 프로젝트 내 `docs/design-reference.html`을 브라우저로 열어 참고 (Hero, TOC, 카드, PARS 박스, 테이블, Callout, Flow, Phase, 체크리스트 등 전체 스타일).

---

## 1. 컬러 (CSS 변수)

| 변수 | 값 | 용도 |
|------|-----|------|
| --bg | #0a0a0f | 페이지 배경 |
| --surface | #12121a | 카드/박스 기본 |
| --surface2 | #1a1a26 | 호버/강조 시 카드 배경 |
| --text | #e8e6e3 | 기본 텍스트 |
| --dim | #6b6b7b | 보조 텍스트, 라벨 |
| --border | rgba(255,255,255,0.06) | 카드/테이블 보더 |
| --accent | #ff3d3d | 강조, P(현상) |
| --accent2 | #ff6b35 | 악센트 그라디언트용 |
| --blue | #4a9eff | 정보/링크, A(응용) |
| --green | #22c55e | 긍정, R(연구유형) |
| --yellow | #facc15 | 주의 |
| --purple | #a78bfa | 보조 강조, S(규모) |
| --cyan | #22d3ee | 보조 (카드 등) |

**PARS 축별 컬러:** P=accent(빨강), A=blue, R=green, S=purple. 카드 상단 2px 그라디언트에 활용.

---

## 2. 타이포그래피

| 용도 | 폰트 | 크기/무게 | 비고 |
|------|------|-----------|------|
| 히어로 타이틀 | Noto Sans KR | 900, clamp(2rem, 5.5vw, 3.5rem) | .blue / .dim 보조 |
| 섹션 제목 h2 | Noto Sans KR | 900, 1.6rem | line-height 1.3 |
| 섹션 소제목 h3 | Noto Sans KR | 900, 1.1rem | margin-top 1.8rem |
| 본문 | Noto Sans KR | 400, .95rem | line-height 1.8 |
| 섹션 번호/라벨 | Space Mono | .65~.7rem, letter-spacing .15~.3em, uppercase | 색: --blue 또는 --dim |
| 메타/코드 | Space Mono | .75~.82rem | 코드: background surface2, color blue |
| PARS 대문자 (P/A/R/S) | Playfair Display | 900, 2~3rem | 카드/박스 강조 |
| Phase 번호 | Playfair Display | 900, 2rem | Phase 카드 |

**폰트 로드:** Noto Sans KR, Space Mono, Playfair Display (Google Fonts 등).

---

## 3. 레이아웃·간격

- **콘텐츠 최대 너비:** 900px, margin 0 auto.
- **패딩:** hero/콘텐츠 세로 3rem~6rem, 좌우 2rem.
- **카드/박스 border-radius:** 10px (일반 카드), 12px (PARS 박스, Phase, Flow).
- **보더:** 1px solid var(--border). 호버 시 rgba(74,158,255,.25) 등으로 강조 가능.

---

## 4. 컴포넌트 패턴 (visual HTML 기준)

### 4.1 Hero (랜딩/아티클 상단)
- min-height 70vh 또는 적절히 축소.
- 배경: 우측 상단 radial-gradient blob (blue~purple, opacity .04~.08), animation pulse 8s.
- **hero-tag:** Space Mono, .7rem, letter-spacing .25em, uppercase, --blue. 앞에 40px 세로선(가상요소).
- **hero h1:** 파란색 브랜드명 + dim 부제. fadeUp 애니메이션.
- **hero-sub:** dim 색, max-width 620px.
- **hero-meta:** flex gap 2rem, Space Mono .75rem, dim + text 강조.

### 4.2 노이즈 텍스처
- position fixed, inset 0, opacity .03, pointer-events none, z-index 높음.
- SVG feTurbulence fractalNoise (baseFrequency .9, numOctaves 4) 또는 이미지.

### 4.3 TOC / 네비 카드 그리드
- **grid:** repeat(auto-fill, minmax(220px, 1fr)), gap .75rem.
- **toc-item:** background surface, border 1px, border-radius 10px, padding 1rem 1.2rem.
- **hover:** border-color blue 25%, transform translateY(-2px), background surface2.
- **toc-num:** Space Mono .65rem, blue, letter-spacing .15em.
- **toc-title:** .88rem, 700.

### 4.4 카드 (일반)
- **card-grid:** repeat(auto-fill, minmax(200px, 1fr)), gap .75rem.
- **card:** surface, border 1px, border-radius 10px, padding 1.2rem. 상단 2px 그라디언트(::before).
- **색상 변형:** c-red (accent→accent2), c-blue (#2563eb→blue), c-green (#059669→green), c-purple (#7c3aed→purple), c-yellow (#d97706→yellow), c-cyan (#0891b2→cyan).
- **card-icon:** 이모지 또는 아이콘, 1.8rem.
- **card-label:** Space Mono .63rem, letter-spacing .15em, uppercase, dim.
- **card-title:** 900, .95rem. **card-desc:** .8rem, dim, line-height 1.5.

### 4.5 PARS 4축 박스
- **pars-grid:** grid 4열 (모바일 700px 이하 2열).
- **pars-box:** surface, border 1px, border-radius 12px, padding 1.5rem, text-align center. hover translateY(-3px).
- **pars-letter:** Playfair Display 3rem 900. P=accent, A=blue, R=green, S=purple.
- **pars-label:** Space Mono .7rem, uppercase, dim. **pars-name:** 700, .9rem.

### 4.6 테이블
- **th:** background surface2, color blue, Space Mono .7rem, letter-spacing .1em, uppercase, padding .65rem .8rem, border-bottom 2px solid rgba(74,158,255,.15).
- **td:** padding .6rem .8rem, border-bottom 1px solid border. tr:hover td background rgba(255,255,255,.02).
- **tbl-wrap:** overflow-x auto.

### 4.7 Callout
- background surface, border-left 3px solid (blue 기본). red/green/yellow/purple 변형.
- padding 1.2rem 1.5rem, border-radius 0 8px 8px 0, font-size .9rem.

### 4.8 Flow (단계 플로우)
- background surface, border-radius 12px, padding 1.5rem.
- **flow-step:** flex, gap .8rem. **flow-arrow:** Space Mono .8rem, dim. **flow-actor:** Space Mono .68rem, padding 2px 8px, border-radius 4px. admin=blue 배경 15%, reader=green 배경 15%.

### 4.9 Phase 카드 (로드맵 등)
- **phase-grid:** auto-fill minmax(190px, 1fr), gap 1rem.
- **phase:** surface, border-radius 12px, padding 1.5rem. 상단 3px 바: 1=blue, 2=green, 3=purple, 4=accent.
- **phase-num:** Playfair 2rem 900, 축별 색. **phase-title:** 900 .95rem. **phase-dur:** Space Mono .7rem dim. **phase-items:** .8rem dim, line-height 1.7.

### 4.10 체크리스트
- **check-item:** flex, gap .6rem, padding .5rem 0, border-bottom 1px border, font-size .88rem.
- **check-box:** 18×18px, border 2px solid dim, border-radius 4px (체크 시 색/아이콘으로 변경).

### 4.11 구분선
- width 60px, height 2px, background linear-gradient(90deg, blue, transparent), margin 3rem 0.

### 4.12 스택/태그 칩
- **stack-grid:** auto-fill minmax(140px, 1fr), gap .6rem.
- **stack-item:** surface, border 1px, border-radius 8px, padding .7rem .8rem, text-align center. stack-cat (Space Mono .6rem dim), stack-name (700 .85rem).

---

## 5. 애니메이션

- **pulse (blob):** scale 1 → 1.15, opacity .5 → 1, 8s ease-in-out infinite.
- **fadeUp:** opacity 0→1, translateY(25px)→0, .8s ease. delay .1s .2s .3s 등으로 순차 적용.
- **섹션 등장:** opacity 0, translateY(30px) → visible 시 1, 0. transition .7s cubic-bezier(.16,1,.3,1). Intersection Observer로 visible 토글.
- **카드 호버:** transition .3s. transform translateY(-2px) 또는 (-3px).

---

## 6. 반응형

- **브레이크포인트:** 700px 이하에서 pars-grid 2열, phase-grid/card-grid/toc-grid 1열.
- PC 우선, 모바일 반응형 필수. Tailwind sm:/md:/lg: 등은 처음부터 적용.
- 접근성: viewport user-scalable:false 금지. touch-action: manipulation 등으로 대체.

---

## 7. PRD 컴포넌트 매핑

- **Layout:** AppLayout, Header(hero 스타일 참고), Footer, DarkThemeProvider
- **탐색:** PARSTabBar, CategoryCardGrid(pars-grid/toc-grid), CategoryCard(card), ArticleCard, SearchBar, PARSBadge(pars-box/카드 변형), ScaleBadge
- **아티클:** ArticlePage, ArticleHeader(hero), MarkdownRenderer(callout/table/code 스타일), DeepDiveRenderer, TableOfContents, ReferenceList, RelatedArticles(card-grid), ShareButtons, CommentSection
- **Admin:** AdminLayout, ArticleEditor, PARSTagSelector(card-grid), ArticleList, CommentManager

구현 시 위 패턴과 변수명을 맞추면 visual HTML과 일관된 UI를 유지할 수 있음.
