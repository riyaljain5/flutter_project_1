import 'dart:convert';

import 'package:fetch_api/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<dynamic> users = [];
  List<dynamic> images = [];
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    getData();
    getimage();
    getpost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Center(
              child: Text("Users",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))),
          backgroundColor: const Color.fromARGB(255, 70, 46, 37),
          leading: IconButton(
            icon: Icon(
              Icons.message_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.camera_enhance,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final name = user['name'];
            final uname = user['username'];
            final id = user['id'];
            final email = user['email'];
            final companyname = user['company']['name'];
            final companyDetail = user['company']['catchPhrase'];

            final image = images[index];
            final imageurl = image['download_url'];

            final post = posts[index];
            final title = post['title'];
            final body = post['body'];
            final userid = post['userId'];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        name: name,
                        // address: address,
                        uname: uname,
                        id: id,
                        userid: userid,
                        email: email, companyname: companyname,
                        companyDetail: companyDetail,
                        imageurl: imageurl, title: title, body: body,
                        posts: posts,
                      ),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      // color: Color.fromARGB(226, 211, 183, 213),
                      color: Colors.white,
                      // color: Color.fromARGB(58, 43, 4, 46),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.brown[100],
                  // borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color.fromARGB(255, 70, 46, 37),
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                          image: NetworkImage(imageurl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          uname,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 70, 46, 37)),
                        ),
                        Text(
                          "Working in " + companyname,
                        ),
                        Text(
                          companyDetail,
                        ),
                        Text(
                          "Connect at:" + email,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void getData() async {
    const url = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json;
    });
  }

  void getimage() async {
    const url = "https://picsum.photos/v2/list?page=2&limit=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      images = json;
    });
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
