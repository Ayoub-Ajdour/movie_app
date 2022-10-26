// ignore_for_file: file_names

import 'package:movie_app/Login/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Signup/MainPagee.dart';
import 'package:movie_app/Signup/signuppage.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          /////////////////////////////

          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/first.jpg"),
            fit: BoxFit.cover,
          )),

          child: Stack(
            alignment: Alignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // Positioned(
              //   top: 90,
              //   child: Image.asset("assets/gifs/2.gif"),
              //   width: 200,
              //   height: 400,
              // ),
              // Positioned(
              //   top: -160,
              //   child: Image.asset("assets/gifs/1.gif"),
              //   width: 200,
              //   height: 900,
              // ),
              // ignore: prefer_const_constructors
              Positioned(
                  // ignore: prefer_const_constructors
                  top: 20,
                  width: 428,
                  // ignore: prefer_const_constructors
                  child: Text(
                    "Your guide to find the best movies",
                    style: const TextStyle(
                        //   fontWeight: FontWeight.bold,
                        fontSize: 41,
                        fontFamily: 'Kaisei_Tokumin',
                        color: Color.fromARGB(255, 107, 104, 104)),
                    textAlign: TextAlign.center,
                  )),
              //
              Positioned(
                  top: 710,
                  left: 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: const Color.fromRGBO(204, 200, 189, 1),
                      minimumSize: const Size(200, 55),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    // Within the `FirstRoute` widget
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                      );
                    },
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Login',
                      style: const TextStyle(fontSize: 24),
                    ),
                  )),

              Positioned(
                  top: 712,
                  left: 215,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: const Color.fromRGBO(204, 200, 189, 1),
                      minimumSize: const Size(130, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signuppage()),
                      );
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(fontSize: 24),
                    ),
                  ))
              //
            ],
          ),
        ));
  }
}
