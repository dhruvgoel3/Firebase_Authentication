import 'package:flutter/material.dart';
class VerifyOtpCode extends StatefulWidget {
 final String verificationId;
  const VerifyOtpCode({super.key,required this.verificationId});

  @override
  State<VerifyOtpCode> createState() => _VerifyOtpCodeState();
}

class _VerifyOtpCodeState extends State<VerifyOtpCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Otp Code',
        ),
      ),
      body: Column(),
    );
  }
}
