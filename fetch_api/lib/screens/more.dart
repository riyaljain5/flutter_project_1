import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Uploads", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 70, 46, 37)),
    );
  }
}
