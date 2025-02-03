import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:macaron_build/src/init/page/init_start_page.dart';  // 경로 수정
import 'package:macaron_build/src/splash/page/splash_page.dart';    // 경로 수정

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late SharedPreferences prefs;
  bool isLoading = true;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    prefs = await SharedPreferences.getInstance();
    isInitialized = prefs.getBool('isInitialized') ?? false;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SplashPage();
    }
    return isInitialized ? const InitStartPage() : const SplashPage();
  }
}



