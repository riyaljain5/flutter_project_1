import 'package:fetch_api/Components/posts.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final int id;
  final String name;
  final String uname;
  final String email;
  final String companyname;
  final String companyDetail;
  final String imageurl;
  final List posts;
  final String title;
  final String body;
  final int userid;

  // final String address;

  const Details(
      {super.key,
      required this.name,
      // required this.address,
      required this.uname,
      required this.id,
      required this.email,
      required this.posts,
      required this.companyname,
      required this.companyDetail,
      required this.imageurl,
      required this.body,
      required this.userid,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title:
              Text(uname, style: TextStyle(color: Colors.white, fontSize: 24)),
          backgroundColor: const Color.fromARGB(255, 70, 46, 37),
        ),
        body: ListView(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              color: Colors.brown[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image(
                        image: NetworkImage(imageurl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 70, 46, 37)),
                      ),
                      Text("Working in" + companyname),
                      Text(companyDetail),
                      Text(
                        "Connect at:" + email,
                      )
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                    child: TabBar(
                      tabs: [
                        Tab(text: "Posts"),
                        Tab(text: "Albums"),
                      ],
                    ),
                  ),
                  Container(
                      height: 1000,
                      child: TabBarView(
                        children: [
                          Userposts(
                            title: title,
                            body: body,
                            id: id,
                            userid: userid,
                            posts: posts,
                          ),
                          Container(
                            child: Text("Albums "),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
