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
            '~ Crud operations Firestore ',
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/istockphoto-1281150061-612x612.jpg",height: 300,width: 400,),
              SizedBox(height: 40,),
              Text('Huhh ! Finally ho gaya.....',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600,color: Colors.indigoAccent),),
              Text("Authentication karna itna bhi mushkil nahi",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.indigoAccent),),
              Text("Ab aa hi gaye ho to kuch naya seekh kar jaoo",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.indigoAccent),)
            ],
          ),
        ),
      ),
    );
  }
}
