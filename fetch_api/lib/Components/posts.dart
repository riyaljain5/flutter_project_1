import 'package:flutter/material.dart';

class Userposts extends StatelessWidget {
  final int id;
  final int userid;
  final String title;
  final String body;
  final List posts;

  const Userposts(
      {super.key,
      required this.body,
      required this.title,
      required this.posts,
      required this.id,
      required this.userid});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final title1 = post['title'];
          final body1 = post['body'];
          final id1 = post['userId'];

          return id == id1
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(10),
                  // height: 200,
                  width: 200,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: const Color.fromARGB(
                              255,
                              70,
                              46,
                              37,
                            ),
                          ),
                        ),
                        Text(body1),
                      ],
                    ),
                  ),
                )
              : Container();
        });
  }
}
