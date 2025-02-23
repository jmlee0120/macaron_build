import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macaron_build/screens/LoginPage.dart';
import 'package:macaron_build/screens/app.dart';
import 'package:macaron_build/screens/board_1.dart';
import 'package:macaron_build/screens/SearchPage.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:macaron_build/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // flutter 엔진과 위젯 시스템을 초기화
  try {
    await Firebase.initializeApp( //firebase 앱을 초기화하여 firebase 기능을 사용할 준비

    );
    Get.put(AuthService());

    runApp(const MyApp()); // flutter 앱 실행
  } catch (e) {
    print('Firebase initialization error: $e');
  }
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Macaron Build',
      initialBinding: BindingsBuilder(() {

      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MainBoard()),

      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


