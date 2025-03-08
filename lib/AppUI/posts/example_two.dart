import 'dart:convert';
import 'package:firebase_one/AppUI/posts/example_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((i) => Photos(title: i['title'], url: i['url'])).toList();
    } else {
      throw Exception("Failed to load photos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Example Two API Fetching",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => ExampleThree());
            },
            child: Text(
              "Go to example three",
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Photos>>(
              future: getPhotos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No data available"));
                }
            
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].title),
                      leading: FadeInImage.assetNetwork(
                        placeholder:
                            'assets/placeholder.png', // Add a placeholder image in assets
                        image: snapshot.data![index].url,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Photos {
  final String title, url;
  Photos({required this.title, required this.url});
}
