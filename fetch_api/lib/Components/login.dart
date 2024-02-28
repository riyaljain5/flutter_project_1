import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text(
          "Login up Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(
          255,
          70,
          46,
          37,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.mode_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            Container(
              height: 500,
              width: 500,
              margin: EdgeInsets.only(top: 100, left: 20, right: 20),
              // color: const Color.fromARGB(
              //   255,
              //   70,
              //   46,
              //   37,
              // )
              color: Colors.brown[200],
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      color: const Color.fromARGB(
                        255,
                        70,
                        46,
                        37,
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
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: TextField(
                        decoration:
                            InputDecoration(labelText: "Enter username:"),
                      ),
                      height: 100,
                      width: 200,
                    ),
                    Container(
                      child: TextField(
                        decoration:
                            InputDecoration(labelText: "Enter password:"),
                      ),
                      height: 100,
                      width: 200,
                    ),
                    InkWell(
                      child: Container(
                          // margin: EdgeInsets.fromLTRB(10, 10, 100, 30),
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(
                                255,
                                70,
                                46,
                                37,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                          )),
                    ),
                    InkWell(
                      child: Container(
                        child: Text("Don't have an account? Sign up!",
                            style: TextStyle(
                              color: const Color.fromARGB(
                                255,
                                70,
                                46,
                                37,
                              ),
                            )),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
