import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/auth/login_screan.dart';
import 'package:firebase_one/utils/utils.dart';
import 'package:firebase_one/widgets/round_button.dart';
import 'package:flutter/material.dart';

class SignupScrean extends StatefulWidget {
  const SignupScrean({super.key});

  @override
  State<SignupScrean> createState() => _SignupScreanState();
}

class _SignupScreanState extends State<SignupScrean> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'SignUp Screan',
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
                        return 'Enter password';
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
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  _auth
                      .createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                    });
                  })
                      .onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                }
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScrean()));
                  },
                  child: Text('Login'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
