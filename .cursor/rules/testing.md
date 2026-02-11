# 테스트 전략

## 단위 테스트

- Jest. 유틸 함수, 훅, 비즈니스 로직 위주
- 예: slug 생성, 읽기 시간 계산, PARS 태그 파싱 등

## 통합 테스트

- API 라우트: supertest 등으로 GET/POST 응답 및 DB 연동 확인
- Admin 로그인 → JWT 발급 → 인증 필요 라우트 호출

## E2E (선택)

- Cypress 또는 Playwright: 홈 → 카테고리 → 아티클 읽기, 검색, 댓글 작성 등

## 실행

```bash
npm test          # 단위
npm run test:api  # API 통합 (예시)
```

MVP에서는 코어 플로우(아티클 CRUD, 카테고리 목록, 아티클 읽기) 위주로 우선 적용.
