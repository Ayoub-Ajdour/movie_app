// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/FirstScreen.dart';
import 'package:movie_app/Home/home.dart';
import 'package:movie_app/Signup/preparingAccount.dart';
import 'package:movie_app/Signup/signuppage.dart';

class MainPagee extends StatelessWidget {
  const MainPagee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return home();
            } else {
              return const signuppage();
            }
          }),
    );
  }
}
