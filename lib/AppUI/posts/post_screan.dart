import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_one/AppUI/auth/signup_screan.dart';
import 'package:firebase_one/AppUI/example_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../Models/PostModel.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  List<PostModel> postList = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      for (var i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigoAccent,
            automaticallyImplyLeading: false,
            title: Text(
              "API fetching",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScrean()));
                    });
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  )),
            ]),
        body: Column(
          children: [
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => ExampleTwo());
                },
                child: Text("Go to example two",style: TextStyle(fontSize: 20),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,),),
            Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(postList[index].title),
                            subtitle: Text(postList[index].body),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
