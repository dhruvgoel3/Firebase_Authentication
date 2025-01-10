import 'dart:async';

import 'package:firebase_one/AppUI/auth/login_screan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScrean())),
    );
  }
}
