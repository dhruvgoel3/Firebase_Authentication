import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/posts/post_screan.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../../widgets/round_button.dart';

class VerifyOtpCode extends StatefulWidget {
  final String verificationId;
  const VerifyOtpCode({super.key, required this.verificationId});

  @override
  State<VerifyOtpCode> createState() => _VerifyOtpCodeState();
}

class _VerifyOtpCodeState extends State<VerifyOtpCode> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify OTP Code',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintText: '6 digit OTP code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundButton(
              onTap: () async {
                final authCredential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: phoneNumberController.text.toString());

                try {
                  await auth.signInWithCredential(authCredential);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostScreen()));
                } catch (e) {}
              },
              child: Text('Veryfy'),
            ),
          ),
        ],
      ),
    );
  }
}
