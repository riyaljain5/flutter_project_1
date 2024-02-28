import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Home Page", style: TextStyle(color: Colors.white))),
          backgroundColor: const Color.fromARGB(
            255,
            70,
            46,
            37,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
            child: Center(
                child: Column(
          children: [
            Container(
                height: 500,
                width: 500,
                margin: EdgeInsets.only(top: 100, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.brown[200],
                ),
                // color: const Color.fromARGB(
                //   255,
                //   70,
                //   46,
                //   37,
                // )

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Welcome to the app!!",
                          style: GoogleFonts.dmSerifDisplay(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        )),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pushNamed(context, '/login')},
                          child: Container(
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(
                                255,
                                70,
                                46,
                                37,
                              ),
                            ),
                            margin: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "Login",
                                style: GoogleFonts.dmSerifDisplay(
                                    color: Colors.white, fontSize: 36),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              {Navigator.pushNamed(context, '/signup')},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(
                                255,
                                70,
                                46,
                                37,
                              ),
                            ),
                            height: 80,
                            width: 150,
                            margin: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "Signup",
                                style: GoogleFonts.dmSerifDisplay(
                                    color: Colors.white, fontSize: 36),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ))
          ],
        ))));
  }
}
