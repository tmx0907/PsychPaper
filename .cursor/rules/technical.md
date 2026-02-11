# 기술 규칙

## 코드 스타일

- TypeScript strict 모드
- ESLint + Prettier
- 함수형 컴포넌트 + Hooks
- async/await 사용 (Promise chaining 지양)

## 네이밍

- 컴포넌트: PascalCase (ArticleCard.tsx, PARSTabBar.tsx)
- 유틸/훅: camelCase (formatReadTime.ts, useArticle.ts)
- 상수: UPPER_SNAKE_CASE
- 타입: PascalCase (Article, Category, Comment)

## 프론트엔드

- 반응형 클래스(sm:, md:, lg:)는 처음부터 적용
- 미사용 의존성은 제거 (번들 크기 관리)
- Audio/비디오 등 이벤트 핸들러는 cleanup에서 명시적 해제

## 백엔드

- 라우트는 도메인별 분리 (articles, categories, comments, admin)
- JWT 검증 미들웨어는 Admin 라우트에만 적용
- 에러는 일관된 JSON 형식으로 응답

## 에러 처리

- 클라이언트: ErrorBoundary로 UI 크래시 방지, 사용자 친화적 메시지
- 서버: 구조화된 로깅, 프로덕션에서는 상세 스택 노출 금지
