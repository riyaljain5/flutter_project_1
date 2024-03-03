import 'dart:convert';

import 'package:fetch_api/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    getpost();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FetchProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            title: Text("Uploads", style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 70, 46, 37)),
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              final title = post['title'];
              final body = post['body'];
              final userid = post['userId'].toString();
              return value.rnum.toString() == userid
                  ? Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.brown[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userid),
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(body)
                        ],
                      ))
                  : Container();
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final model = context.read<FetchProvider>();
            model.generateRandomNumber();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  void getpost() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      posts = json;
    });
  }
}
