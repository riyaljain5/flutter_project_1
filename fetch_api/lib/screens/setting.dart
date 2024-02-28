import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings", style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 70, 46, 37)),
    );
  }
}
