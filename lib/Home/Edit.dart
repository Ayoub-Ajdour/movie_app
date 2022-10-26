// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/home.dart';
import 'package:movie_app/Home/pageprofile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:movie_app/Login/pagelogin.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  final emailController = TextEditingController();
  final fullnameController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
  }

  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var name;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xff555555),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const pageprofile()),
            );
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          FutureBuilder(
              future: getfullname(),
              builder: (context, dynamic snapshot) {
                int i = 0, c = 1;
                while (snapshot.data.docs[i]['email'] != user.email) {
                  c = i;
                  i++;
                  // print(i);
                }
                c++;

                name = snapshot.data.docs[c]['full_name'];

                return ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 150)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: TextField(
                        controller: fullnameController,
                        textAlign: TextAlign.center,
                        // obscureText: isPasswordTextField ? showPassword : false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: "Full Name",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "${snapshot.data.docs[c]['full_name']}",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    //
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: TextField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        // obscureText: isPasswordTextField ? showPassword : false,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 3),
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: "${snapshot.data.docs[c]['email']}",
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText,

                        //   cursorColor: Colors.white,
                        textInputAction: TextInputAction.done,
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: "Password",
                          // fillColor: const Color.fromARGB(95, 128, 128, 124),
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
                                _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                //  color: Color.fromARGB(255, 71, 71, 70),
                              )),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(24),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(241, 104, 69, 39)),
                          onPressed: () {
                            saveinfos(
                                fullnameController,
                                snapshot.data.docs[c]['full_name'],
                                emailController,
                                snapshot.data.docs[c]['email'],
                                passwordController);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => pageprofile()));
                          },
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.save_as_outlined,
                            size: 32,
                          ),
                          // ignore: prefer_const_constructors
                          label: Text(
                            'Save',
                            style: const TextStyle(fontSize: 24),
                          )),
                    ),
                  ],
                );
              }),
          FutureBuilder(
              future: getfullname(),
              builder: (context, dynamic snapshot) {
                int i = 0, c = 1;
                while (snapshot.data.docs[i]['email'] != user.email) {
                  c = i;
                  i++;
                  // print(i);
                }
                c++;
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FutureBuilder(
                        future: downloadImage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData &&
                              snapshot.data != null) {
                            print(snapshot.data);
                            return Container(
                              padding: const EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 2,
                              // decoration: BoxDecoration(
                              //   border:
                              //       Border.all(color: Colors.white, width: 5),
                              //   shape: BoxShape.circle,
                              //   color: Colors.white,
                              // ),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 5),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(snapshot.data!),
                                      fit: BoxFit.cover)),
                              // child: Image.network(snapshot.data!,
                              //     fit: BoxFit.cover),
                            );
                            // Container(
                            // padding: const EdgeInsets.all(10.0),
                            // width: MediaQuery.of(context).size.width / 2,
                            // height: MediaQuery.of(context).size.width / 2,
                            // decoration: BoxDecoration(
                            //   border:
                            //       Border.all(color: Colors.white, width: 5),
                            //   shape: BoxShape.circle,
                            //   color: Colors.white,
                            //   image: DecorationImage(
                            //     fit: BoxFit.cover,
                            //     image:Image.network(snapshot.data!),
                            // Image.network(snapshot.data),
                            // AssetImage('assets/images/avatar.png'),
                            // ),
                            //   ),
                            // );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 260, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  addImage();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<String> downloadImage() async {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final user = FirebaseAuth.instance.currentUser!;
  var id = user.uid;
  String downloadURL = await storage.ref('userpictures/$id').getDownloadURL();
  return downloadURL;
}

void addImage() async {
  print("hey");
  final results = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['png', 'jpge', 'jpg'],
  );
  if (results == null) {
    // ScaffoldMessenger.of(context)
    // .showSnackBar(const SnackBar(content: Text("no file selected")));
    return null;
  }
  final path = results.files.single.path;
  final fileName = results.files.single.name;
  print(path);
  print(fileName);

  uploadimage(path, fileName).then((value) => print('Done'));
}

Future uploadimage(path, fname) async {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  // File file = File(p);
  File file = File(path);
  print(file.toString());
  final user = FirebaseAuth.instance.currentUser!;
  var id = user.uid;
  try {
    await storage.ref('userpictures/$id').putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    print(e);
  }
}

void saveinfos(
    TextEditingController fullnameController,
    doc,
    TextEditingController emailController,
    doc2,
    TextEditingController passwordController) {
  var changedpassword = false;
  var name, email, password;

  if (fullnameController.text == '') {
    name = doc;
  } else {
    name = fullnameController.text;
  }
  if (emailController.text == '') {
    email = doc2;
  } else {
    email = emailController.text;
  }
  ;
  if (passwordController != '') {
    changedpassword = true;
    password = passwordController.text;
  }

  var emailControllerr = emailController.toString();
  // print(name);
  var collection = FirebaseFirestore.instance.collection('users');
  collection
      .doc(doc2) // <-- Doc ID where data should be updated.
      .update({
        'full_name': name,
        'email': email,
      })
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
  FirebaseAuth.instance.currentUser
      ?.updateEmail(email)
      .then((value) => print("email Updated"))
      .catchError((error) => print("Failed to update email: $error"));
  if (changedpassword == true) {
    FirebaseAuth.instance.currentUser
        ?.updatePassword(password)
        .then((value) => print("PWD Updated"))
        .catchError((error) => print("Failed to update PWD: $error"));
    FirebaseAuth.instance.signOut();
  }
}

void saveinfo(
    TextEditingController fullnameController,
    TextEditingController emailController,
    TextEditingController passwordController) {
  // print(emailController.text);
  var changedpassword = false;
  if (emailController.text == '') {}
  if (fullnameController.text == '') {}
  if (passwordController != '') {
    changedpassword = true;
  }
}

class profilewidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const profilewidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   width: 130,
          // // ),
          // ListTile(
          //   leading: Icon(
          //     icon,
          //     color: Colors.blueGrey[900],
          //   ),
          //   title: Text(
          //     title,
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontFamily: 'Signika Negative',
          //         color: Colors.black87),
          //   ),
          //   onTap: () {
          //     print("hey");
          //   },
          // ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.blueGrey[900],
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Signika Negative',
                    color: Colors.black87),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueGrey[900],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  var showPassword = false;
  return Padding(
    padding: const EdgeInsets.all(35.0),
    child: TextField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    // setState(() {
                    //   showPassword = !showPassword;
                    // });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  );
}
