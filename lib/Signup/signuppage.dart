// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Signup/preparingAccount.dart';
import 'package:movie_app/utils.dart' show Utils;

// ignore: camel_case_types
class signuppage extends StatefulWidget {
  const signuppage({super.key});

  @override
  State<signuppage> createState() => _signuppageState();
}

// ignore: camel_case_types
class _signuppageState extends State<signuppage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordControllerr = TextEditingController();
  final fullnameController = TextEditingController();
  final phonenumberController = TextEditingController();

  late final String uid;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordControllerr.dispose();
    phonenumberController.dispose();
    fullnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.zero,

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/images/2.png")),
            //

            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                // autofocus: false,

                controller: fullnameController,
                cursorColor: const Color.fromARGB(255, 59, 67, 29),

                textInputAction: TextInputAction.next,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(95, 128, 128, 124),
                  hintText: "Full Name",
                  // ignore: prefer_const_constructors
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                // autofocus: false,

                controller: emailController,
                cursorColor: const Color.fromARGB(255, 59, 67, 29),

                textInputAction: TextInputAction.next,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(95, 128, 128, 124),
                  hintText: "Email",
                  // ignore: prefer_const_constructors
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                // autofocus: false,

                controller: phonenumberController,
                cursorColor: const Color.fromARGB(255, 59, 67, 29),

                textInputAction: TextInputAction.next,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(95, 128, 128, 124),
                  hintText: "Phone Number",
                  // ignore: prefer_const_constructors
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                // autofocus: false,

                controller: passwordController,
                cursorColor: const Color.fromARGB(255, 59, 67, 29),

                textInputAction: TextInputAction.next,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(95, 128, 128, 124),
                  hintText: "Password",
                  // ignore: prefer_const_constructors
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: TextField(
                // autofocus: false,

                //controller: emailController,
                cursorColor: Color.fromARGB(255, 59, 67, 29),

                textInputAction: TextInputAction.next,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(95, 128, 128, 124),
                  hintText: "Retype Password",
                  // ignore: prefer_const_constructors
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(20),
                  ),
                ),
                obscureText: true,
              ),
            ),
            // TextFormField(
            //   controller: passwordController,
            //   //   cursorColor: Colors.white,
            //   textInputAction: TextInputAction.done,
            //   decoration: const InputDecoration(labelText: 'password'),
            //   obscureText: true,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   validator: (value) => value != null && value.length < 6
            //       ? 'Enter min 6 characters'
            //       : null,
            // ),
            // TextFormField(
            //   controller: passwordControllerr,
            //   //   cursorColor: Colors.white,
            //   textInputAction: TextInputAction.done,
            //   decoration: const InputDecoration(labelText: 'retype password'),
            //   obscureText: true,
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   validator: (value) => value != null &&
            //           value.length < 6 &&
            //           value != passwordController
            //       ? 'Enter min 6 characters'
            //       : null,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(241, 104, 69, 39)),
                  onPressed: () {
                    singup();
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.lock_open,
                    size: 32,
                  ),
                  // ignore: prefer_const_constructors
                  label: Text(
                    'Sign up',
                    style: const TextStyle(fontSize: 24),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future singup() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      final User? user = auth.currentUser;
      final uid = user?.uid;

      //////////////////////////////////////////////  addUser(uid);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => preparingAccount(
                  fullnameController.text,
                  emailController.text,
                  phonenumberController.text,
                  passwordController.text,
                  uid.toString())));
    } on FirebaseAuthException catch (er) {
      Utils.showSnackBar(er.message);
      // }
    }

    // Future addUser(id) async {
    //   final messageRef =
    //       FirebaseFirestore.instance.collection("type_user").doc("0");
    //   final docUser = FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(emailController.text);
    //   //id = docUser.id;
    //   final json = {
    //     'id': id,
    //     'full_name': fullnameController.text,
    //     'email': emailController.text,
    //     'type': messageRef,
    //     'phone_number': phonenumberController.text,
    //     'best_movie': "Advengers",
    //     'favorite_category': "Comedie",
    //     'favorite_pc': "Maravel",
    //   };
    //   docUser.set(json);
    // }
  }
}
