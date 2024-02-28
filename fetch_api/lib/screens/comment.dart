import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add comments", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 70, 46, 37)),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 100,
          ),
        );
      }),
    );
  }
}
