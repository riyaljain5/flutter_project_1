import 'package:fetch_api/screens/comment.dart';

import 'package:fetch_api/screens/home.dart';
import 'package:fetch_api/Components/login.dart';
import 'package:fetch_api/screens/more.dart';
import 'package:fetch_api/screens/profile.dart';
import 'package:fetch_api/screens/setting.dart';
import 'package:fetch_api/Components/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int SelectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      SelectedIndex = index;
    });
  }

  final List _pages = [Home(), Profile(), Upload(), Comments(), Settings()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/signup': (context) => Signup(),
        '/login': (context) => Login(),
        '/profile': (context) => Profile(),
      },
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.muktaTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        // appBar: AppBar(title: Text("fetch api")),
        body: _pages[SelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: SelectedIndex,
          onTap: navigateBottomBar,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.brown[200],
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Upload",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.comment),
              label: "Comments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ],
        ),
      ),
    );
  }
}
