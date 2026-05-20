# 🌱 3Team - Farmstory 웹 페이지 제작

## 📌 프로젝트 소개

본 프로젝트는 **팜스토리(Farmstory) 웹사이트**를 참고하여  
HTML과 CSS를 활용해 메인 페이지와 각 메뉴별 서브 페이지를 구현하는 팀 프로젝트입니다.

웹 페이지의 기본 구조를 이해하고,  
공통 레이아웃과 페이지별 콘텐츠를 직접 제작하며  
GitHub를 활용한 협업 과정을 익히는 것을 목표로 합니다.

---

## 👥 팀원

| 이름 |
|---|
| 정인길 |
| 허민재 |
| 이성찬 |
| 한성주 |

---

## 🛠 사용 기술

| 구분 | 기술 |
|---|---|
| Frontend | HTML5, CSS3 |
| 협업 도구 | Git, GitHub |
| 개발 환경 | VS Code, Eclipse |

---

## 🎯 프로젝트 목표

- 팜스토리 웹사이트의 전체적인 화면 구성 구현
- 시안과 유사한 레이아웃 및 디자인 제작
- 메뉴별 페이지를 폴더 구조에 맞게 체계적으로 분리
- 공통 Header, Footer, Aside 영역 구현
- Git 브랜치와 Pull Request를 활용한 협업 경험
- 정적 웹 페이지 제작 과정 이해

---

## 📄 제작 페이지

### 1. 팜스토리
- 메인 페이지
- 인사말
- 찾아오시는 길

### 2. 장보기
- 상품목록
- 상품상세보기
- 장바구니
- 주문하기

### 3. 농작물이야기
- 농작물이야기
- 텃밭가꾸기
- 귀농학교

### 4. 이벤트
- 이벤트 캘린더

### 5. 커뮤니티
- 공지사항
- 오늘의 식단
- 나도요리사
- 고객문의
- 자주 묻는 질문

### 6. 사용자
- 로그인
- 이용약관
- 회원가입

### 7. 찾기
- 아이디 찾기
- 아이디 찾기 결과
- 비밀번호 찾기
- 비밀번호 찾기 결과

### 8. 관리자
- 관리자 메인
- 상품목록
- 상품등록
- 주문목록
- 회원목록

---

## 📁 폴더 구조

```bash
farmstory/
├── index.html                              # 팜스토리 > 메인
│
├── about/
│   ├── greeting.html                       # 팜스토리 > 인사말
│   └── direction.html                       # 팜스토리 > 찾아오시는 길
│
├── market/
│   ├── list.html                           # 장보기 > 상품목록
│   ├── detail.html                         # 장보기 > 상품상세보기
│   ├── cart.html                           # 장보기 > 장바구니
│   └── order.html                          # 장보기 > 주문하기
│
├── story/
│   ├── intro.html                          # 농작물이야기 > 농작물이야기
│   ├── garden.html                         # 농작물이야기 > 텃밭가꾸기
│   └── school.html                         # 농작물이야기 > 귀농학교
│
├── event/
│   └── calendar.html                       # 이벤트 > 이벤트 캘린더
│
├── community/
│   ├── notice/
│   │   └── list.html                       # 커뮤니티 > 공지사항
│   │
│   ├── menu/
│   │   └── write.html                      # 커뮤니티 > 오늘의 식단
│   │
│   ├── chef/
│   │   └── view.html                       # 커뮤니티 > 나도요리사
│   │
│   ├── qna/
│   │   └── modify.html                     # 커뮤니티 > 고객문의
│   │
│   └── faq/
│       └── list.html                       # 커뮤니티 > 자주 묻는 질문
│
├── user/
│   ├── login.html                          # 사용자 > 로그인
│   ├── terms.html                          # 사용자 > 이용약관
│   └── register.html                       # 사용자 > 회원가입
│
├── find/
│   ├── find_id.html                        # 찾기 > 아이디 찾기
│   ├── find_id_result.html                 # 찾기 > 아이디 찾기 결과
│   ├── find_password.html                  # 찾기 > 비밀번호 찾기
│   └── find_password_result.html           # 찾기 > 비밀번호 찾기 결과
│
├── admin/
│   ├── index.html                          # 관리자 > 메인
│   │
│   ├── product/
│   │   ├── list.html                       # 관리자 > 상품목록
│   │   └── register.html                   # 관리자 > 상품등록
│   │
│   ├── order/
│   │   └── list.html                       # 관리자 > 주문목록
│   │
│   └── user/
│       └── list.html                       # 관리자 > 회원목록
│
├── css/
│   ├── common.css                           # 공통 스타일
│   ├── main.css                            # 메인 페이지 스타일
│   ├── sub.css                             # 일반 서브 페이지 스타일
│   ├── market.css                          # 장보기 페이지 스타일
│   ├── community.css                       # 커뮤니티 페이지 스타일
│   ├── user.css                            # 사용자 페이지 스타일
│   └── admin.css                           # 관리자 페이지 스타일
│
└── images/                                 # 이미지 파일