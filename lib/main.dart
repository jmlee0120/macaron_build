import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macaron_build/screens/LoginPage.dart';
import 'package:macaron_build/screens/app.dart';
import 'package:macaron_build/screens/board_1.dart';
import 'package:macaron_build/screens/SearchPage.dart';
import 'package:macaron_build/screens/WelcomePage.dart';
import 'firebase_options.dart';
import 'package:macaron_build/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 엔진과 위젯 시스템을 초기화
  try {
    await Firebase.initializeApp(); // Firebase 앱 초기화

    // ✅ AuthService 비동기 초기화 및 주입
    await Get.putAsync(() => AuthService().init());

    runApp(const MyApp()); // Flutter 앱 실행
  } catch (e) {
    print('Firebase initialization error: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Macaron Build',

      // ✅ 사용자 상태에 따라 초기 라우트 설정
      initialRoute: Get.find<AuthService>().user.value != null ? '/main' : '/welcome',

      // ✅ GetX 의존성 주입 (initialBinding)
      initialBinding: BindingsBuilder(() {
        Get.put(AuthService());
      }),

      // initialRoute: '/welcome',  // 로그인 상태와 관계없이 WelcomePage로 시작

      // ✅ GetX 라우터 설정
      getPages: [
        GetPage(name: '/welcome', page: () => const WelcomePage()), // 첫 화면 (로그인 화면)
        GetPage(name: '/main', page: () => MainBoard()), // 메인 화면
        /* GetPage(name: '/login', page: () => const LoginPage()), // 로그인 화면
        GetPage(name: '/app', page: () => const App()), // 앱 화면
        GetPage(name: '/board', page: () => const BoardPage()), // 게시판 화면
        GetPage(name: '/search', page: () => const SearchPage()), // 검색 화면 */
      ],

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}



