import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';

class LoginPage extends GetView<AuthService> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,         
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/macaron_logo3.png',
                    height: 126.0,
                    width: 128.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            const Text(
              '아이디',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: emailController,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: '아이디',
                filled: true,
                fillColor: Colors.blue[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '비밀번호',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: '비밀번호',
                filled: true,
                fillColor: Colors.blue[50],
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () async {
                final result = await controller.signIn(
                  emailController.text,
                  passwordController.text,
                );
                if (result != null) {
                  Get.offAllNamed('/');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
              ),
              child: const Text(
                '로그인',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    '아이디 찾기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text('|', style: TextStyle(fontSize: 14.0, color: Colors.black54)),
                  SizedBox(width: 12.0),
                  Text(
                    '비밀번호 찾기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 