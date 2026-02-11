# 보안

## Admin 인증

- JWT (jsonwebtoken). 로그인 성공 시 토큰 발급, Admin 라우트에서 Bearer 토큰 검증
- 비밀번호는 bcrypt 등으로 해시 저장

## 댓글

- MVP: 닉네임 + 비밀번호(선택). 수정/삭제 시 비밀번호로 본인 확인할지 정책 명시 후 구현
- 부적절 댓글 삭제는 Admin만 가능

## Deep Dive HTML (XSS 방지)

- HTML 본문을 그대로 렌더링할 경우 XSS 위험. 작성자는 Admin 1인이라도 **HTML sanitize(DOMPurify 등) 적용** 권장
- iframe sandbox 또는 CSP로 스크립트 실행 제한 검토

## 환경변수

- JWT_SECRET, DATABASE_URL, 업로드 경로 등은 환경변수로 관리. .env는 버전 관리 제외

## Rate limiting (선택)

- 댓글 작성 등 공개 API에 rate limit 적용 시 스팸·남용 완화
