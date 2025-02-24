import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rxn<User> user = Rxn<User>(); // 사용자의 상태를 실시간으로 관리

  Future<AuthService> init() async {
    _auth.authStateChanges().listen((User? u) {
      user.value = u; // 사용자 상태 업데이트
    });
    return this;
  }

  // ✅ Google 로그인 기능
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // 구글 계정 선택
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // 사용자가 로그인 취소

      // 인증 정보 가져오기
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Firebase에 인증 정보 전달
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase에 로그인 요청
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // ✅ 로그아웃 기능
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
