# project-overview (프로젝트 개요)
게시판 글 작성성과 모임 주최를 할 수 있는 어플리케이션 제작

# feature-requirements (기능 요구사항)
- flutter, dart, firebase 사용합니다
- 게시판 글 작성,수정,삭제와 모임 주최,참가,취소 기능이 구현됩니다.
- 게시글과 모임 주최 글들은 데이터에 저장됩니다.
- 게시글과 모임 주최 글들은 화면에 표시됩니다.
- 게시글과 모임 주최 글들은 검색 기능이 있습니다.



# relevant-docs(관련 코드)

# current-file-structure(현재 파일 구조)

lib/
├── main.dart                   // 앱 시작점: Firebase 초기화, GetMaterialApp 설정, 라우트 연결
├── app_pages.dart              // GetX 라우트 설정 (named routes)
├── data/
│   ├── models/                 // 데이터 모델 정의
│   │   ├── user.dart           // 회원정보 모델
│   │   ├── post.dart           // 게시글 모델
│   │   └── meeting.dart        // 모임 모델
│   ├── services/               // Firebase 연동 및 기타 외부 API 호출
│   │   └── firebase_service.dart
│   └── repositories/           // 서비스 데이터를 받아 모델로 변환 및 가공
│       ├── user_repository.dart
│       ├── post_repository.dart
│       └── meeting_repository.dart
├── modules/                    // 기능(Feature)별 폴더 (각 모듈은 Binding, Controller, View로 구성)
│   ├── auth/                   // 회원가입/로그인 관련 모듈
│   │   ├── binding/
│   │   │   └── auth_binding.dart
│   │   ├── controller/
│   │   │   └── auth_controller.dart
│   │   └── view/
│   │       └── signup_page.dart
│   ├── home/                   // 홈 화면 (하단 네비게이션 포함)
│   │   ├── binding/
│   │   │   └── home_binding.dart
│   │   ├── controller/
│   │   │   └── home_controller.dart
│   │   └── view/
│   │       └── home_page.dart
│   ├── meeting/                // 모임 주최 관련 모듈
│   │   ├── binding/
│   │   │   └── meeting_binding.dart
│   │   ├── controller/
│   │   │   └── meeting_controller.dart
│   │   └── view/
│   │       └── meeting_page.dart
│   ├── post/                   // 게시글 작성 관련 모듈
│   │   ├── binding/
│   │   │   └── post_binding.dart
│   │   ├── controller/
│   │   │   └── post_controller.dart
│   │   └── view/
│   │       └── post_page.dart
│   ├── profile/                // 프로필 설정 및 확인 모듈
│   │   ├── binding/
│   │   │   └── profile_binding.dart
│   │   ├── controller/
│   │   │   └── profile_controller.dart
│   │   └── view/
│   │       └── profile_page.dart
│   └── notifications/          // 알림 페이지 모듈
│       ├── binding/
│       │   └── notifications_binding.dart
│       ├── controller/
│       │   └── notifications_controller.dart
│       └── view/
│           └── notifications_page.dart
├── global_widgets/             // 여러 모듈에서 사용하는 공통 위젯 (예: 하단 네비게이션 바)
│   └── bottom_nav_bar.dart
└── utils/
    ├── constants.dart          // 상수 (컬러, 문자열, 키 값 등)
    └── helpers.dart            // 공통 헬퍼 함수, 포맷 등



#rules(규칙)
