import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/auth/verify_otp_code.dart';
import 'package:firebase_one/utils/utils.dart';
import 'package:firebase_one/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login With Phone',
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
                hintText: 'Enter your phone number',
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
              onTap: () {
                setState(() {
                  loading = false;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      setState(() {
                        loading = false;
                      });
                      Utils().toastMessage(e.toString());
                    },
                    codeSent: (String verificationId, int? Token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyOtpCode(
                                  verificationId: verificationId)));
                      setState(() {
                        loading = false;
                      });
                      },
                    codeAutoRetrievalTimeout: (e) {
                      Utils().toastMessage(e.toString());
                      setState(() {
                        loading = false;
                      });
                    });
              },
              child: Text('Login'),
              loading: false,
            ),
          ),
        ],
      ),
    );
  }
}
