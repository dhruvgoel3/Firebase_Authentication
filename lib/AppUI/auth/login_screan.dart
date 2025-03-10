import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/auth/login_with_phone.dart';
import 'package:firebase_one/AppUI/auth/signup_screan.dart';
import 'package:firebase_one/AppUI/posts/post_screan.dart';
import 'package:firebase_one/utils/utils.dart';
import 'package:firebase_one/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../firebase_services/auth_service.dart';

class LoginScrean extends StatefulWidget {
  const LoginScrean({super.key});

  @override
  State<LoginScrean> createState() => _LoginScreanState();
}

class _LoginScreanState extends State<LoginScrean> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final googleSignInDevices = GooglesignwithDevices();

  FirebaseAuth _auth = FirebaseAuth.instance;
  //
  // Future<UserCredential?> loginWithGoogle() async {
  //   try {
  //     final googleUser = await GoogleSignIn().signIn();
  //     final googleAuth = await googleUser?.authentication;
  //     final cred = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     return await _auth.signInWithCredential(cred);
  //   } catch (e) {
  //     Utils().toastMessage(e.toString());
  //   }
  //   return null;
  // }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Login Screan',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            RoundButton(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  login();
                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScrean()));
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginWithPhone()));
              },
              child: Container(
                height: 50,
                child: Center(child: Text('Login with Phone')),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () async {
                  final User = await googleSignInDevices.signUpwithGmail();

                  if (User != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PostScreen()));
                    Get.snackbar(
                      "",
                      backgroundColor: Colors.lightBlue,
                      titleText: Text("Sign in sucessfull"),
                      'Signed in as ${User.displayName}',
                    );
                  } else {
                    Get.snackbar('Error', 'SignIn is failed');
                  }
                },
                child: Text("Sign Up with Gmail"))
          ],
        ),
      ),
    );
  }
}
