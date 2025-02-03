import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,         
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start, // 기본적으로 좌측 정렬
          children: [
            // 로고 (가운데 정렬)
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
            SizedBox(height: 40.0),

            // 아이디 입력 필드 (좌측 정렬)
            Text(
              '아이디',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: emailController, //
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: '아이디',
                filled: true,
                fillColor: Colors.blue[50],
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // 비밀번호 입력 필드 (좌측 정렬)
            Text(
              '비밀번호',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: '비밀번호',
                filled: true,
                fillColor: Colors.blue[50],
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 32.0),

            // 로그인 버튼 (좌측 정렬)
            ElevatedButton(
              onPressed: () {
                print('Log In button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center, // 텍스트는 중앙 정렬
              ),
              child: Text(
                '로그인',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // 아이디 찾기 / 비밀번호 찾기 (가운데 정렬)
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // 최소 크기로 맞춤
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