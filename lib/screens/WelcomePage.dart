import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macaron_build/services/auth_service.dart';
import 'package:macaron_build/screens/app.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find<AuthService>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ 로고 이미지
            Image.asset(
              'assets/macaron_logo3.png', // assets 폴더에 로고 추가
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),

            const Text(
              'Welcome to the Macaron',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // ✅ Google 로그인 버튼
            ElevatedButton.icon(
              icon: Image.asset(
                'assets/google_logo.png', // 구글 로고 이미지 (assets 폴더에 추가)
                width: 24,
                height: 24,
              ),
              label: const Text('Google 계정으로 로그인'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(250, 50),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                final userCredential = await authService.signInWithGoogle();
                if (userCredential != null) {
                  Get.off(() => const App()); // ✅ 로그인 성공 시 다음 페이지로 이동
                } else {
                  Get.snackbar('로그인 실패', 'Google 로그인에 실패했습니다.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
