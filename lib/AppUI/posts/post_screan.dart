import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/auth/login_screan.dart';
import 'package:flutter/material.dart';

class PostScrean extends StatefulWidget {
  const PostScrean({super.key});

  @override
  State<PostScrean> createState() => _PostScreanState();
}

class _PostScreanState extends State<PostScrean> {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            '~ Aa gaye authentication karke',
            style: TextStyle(color: Colors.white,fontSize: 19),
          )),
          actions: [
            IconButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScrean()));
                  });
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Post Screan'),
          ],
        ),
      ),
    );
  }
}
