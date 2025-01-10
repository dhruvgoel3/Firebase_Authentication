import 'package:firebase_one/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';
class SplashScrean extends StatefulWidget {
  const SplashScrean({super.key});

  @override
  State<SplashScrean> createState() => _SplashScreanState();
}

class _SplashScreanState extends State<SplashScrean> {

  SplashServices splashScrean = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScrean.isLogin(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screan'),
      ),
    );
  }
}
