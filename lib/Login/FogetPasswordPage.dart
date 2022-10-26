// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils.dart';

class FogetPasswordPage extends StatefulWidget {
  const FogetPasswordPage({super.key});

  @override
  State<FogetPasswordPage> createState() => _FogetPasswordPageState();
}

class _FogetPasswordPageState extends State<FogetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: prefer_const_constructors
                Text(
                  "Receive an email to \n reset your password",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),

                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 390,
                  height: 68,
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

                const SizedBox(
                  height: 20,
                ),

                SizedBox(
                  width: 319,
                  height: 68,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(241, 104, 69, 39)),
                      onPressed: () {
                        resetPassword();
                      },
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.restore_page,
                      ),
                      // ignore: prefer_const_constructors
                      label: Text(
                        'Reset Password',
                        style: const TextStyle(fontSize: 24),
                      )),
                ),
              ],
            )),
      ),
    );
  }

  Future resetPassword() async {
    // print("hey" + emailController.text.trim());
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     // ignore: prefer_const_constructors
    //     builder: (context) => Center(
    //           child: const CircularProgressIndicator(),
    //         ));
    try {
      await auth.sendPasswordResetEmail(email: emailController.text.trim());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      Utils.showSnackBar('Password Reset Email send');
    } on FirebaseAuthException catch (er) {
      print(er);
      Utils.showSnackBar(er.message);
    }
  }
}
