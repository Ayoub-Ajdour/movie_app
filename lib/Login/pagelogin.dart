// ignore_for_file: unused_local_variable, unused_element, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'FogetPasswordPage.dart';

// ignore: camel_case_types
class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,

        // prototypeItem: Image(image: AssetImage("assets/images/11.png")),

        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage("assets/images/11.png")),
          ),
          // ignore: prefer_const_constructors

          // const SizedBox(
          //   height: 10,
          // ),
          //  Image(image: AssetImage("assets/gifs/3.gif")),
          // ignore: prefer_const_constructors
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Image(image: AssetImage("assets/images/film.png")),
          ),
          // const SizedBox(height: 30),
          // SizedBox(
          //   width: 319,
          //   height: 68,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              // autofocus: false,

              controller: emailController,
              cursorColor: const Color.fromARGB(255, 59, 67, 29),

              textInputAction: TextInputAction.next,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(95, 128, 128, 124),
                hintText: "Your email",
                // ignore: prefer_const_constructors
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 71, 71, 70),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 15),
          Center(
            child:
                // SizedBox(
                //   width: 319,
                //   height: 68,
                Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                controller: passwordController,
                obscureText: _obscureText,
                //   cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(95, 128, 128, 124),
                  hintText: "Your password",
                  suffixIcon: GestureDetector(
                      onTap: () {
                        // getobscureText(!obscureText);
                        // print(_obscureText);
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Color.fromARGB(255, 71, 71, 70),
                      )),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(24),
                    child: Icon(
                      Icons.lock,
                      color: Color.fromARGB(255, 71, 71, 70),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 5),
          GestureDetector(
              child: Text(
                '                                                                Forget Password?',
                style: TextStyle(
                  // decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const FogetPasswordPage()),
                  )),

          // const SizedBox(
          //   height: 34,
          // ),
          // SizedBox(
          //   width: 319,
          //   height: 68,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(241, 104, 69, 39)),
                onPressed: () {
                  singin();
                },
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                // ignore: prefer_const_constructors
                label: Text(
                  'Sign In',
                  style: const TextStyle(fontSize: 24),
                )),
          ),
          const SizedBox(
            height: 9,
          ),
          // ignore: prefer_const_constructors
          Center(
            child: const Text(
              "Or  Login using Google",
              style: TextStyle(
                  fontFamily: 'Kaisei_Tokumin', fontWeight: FontWeight.w900),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          GestureDetector(
              onTap: () {
                Loginwithgoogle();
              }, // Image tapped
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 180),
                child: Image.asset(
                  'assets/images/google.png',
                  fit: BoxFit.cover, // Fixes border issues
                  width: 48,
                  height: 49,
                ),
              ))
        ],
      ),
    );
  }

  Future singin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    CircularProgressIndicator();
  }
}

final googleSignIn = GoogleSignIn();
GoogleSignInAccount? _user;
GoogleSignInAccount get user => _user!;
// ignore: non_constant_identifier_names
Future Loginwithgoogle() async {
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return;
  _user = googleUser;
  final googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}
