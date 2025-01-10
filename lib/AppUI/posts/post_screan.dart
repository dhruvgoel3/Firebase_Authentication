import 'package:flutter/material.dart';

class PostScrean extends StatefulWidget {
  const PostScrean({super.key});

  @override
  State<PostScrean> createState() => _PostScreanState();
}

class _PostScreanState extends State<PostScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'Post Screan',
          style: TextStyle(color: Colors.white),
        )),
      ),
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
