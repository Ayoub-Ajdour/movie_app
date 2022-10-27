// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/Home/Body.dart';
import 'package:movie_app/Home/Edit.dart';
import 'package:movie_app/Home/favorite.dart';
import 'package:movie_app/Home/pageprofile.dart';
import 'package:movie_app/Home/profile.dart';
import 'package:movie_app/Home/watchlater.dart';
import 'package:movie_app/Login/MainPage.dart';
import 'package:movie_app/Login/pagelogin.dart';
import 'package:movie_app/model/movie.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(

        //// backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        drawer: const MenuBar(),
        appBar: AppBar(
          elevation: 0,

          backgroundColor: const Color.fromARGB(32, 0, 0, 0),
          // leading: IconButton(
          //   // padding: EdgeInsets.only(left: 20.0),
          //   // icon: Icon(Icons.menu),
          //   icon: SvgPicture.asset("assets/icons/menu.svg"),
          //   color: Color.fromARGB(131, 0, 0, 0),
          //   onPressed: () {
          //     //  Scaffold.of(context).openDrawer();
          //     MenuBar();
          //   },
          // ),
          title: Center(
            child: Text(
              "Movies Guid".toUpperCase(),
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Colors.black45,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'Kaisei_Tokumin',
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pageprofile()));
                },
                child: FutureBuilder(
                    future: downloadImage(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData &&
                          snapshot.data != null) {
                        print(snapshot.data);
                        return CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!),
                        );
                      } else {
                        return const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                        );
                        ;
                      }
                    }),
              ),
            )
          ],
        ),
        body: Body());
  }
}

Future getdata() async {
  var result = await FirebaseFirestore.instance.collection('movies').get();
  return result;
}

Future getfullname() async {
  var result = await FirebaseFirestore.instance.collection('users').get();
  return result;
}

class MenuBar extends StatelessWidget {
  const MenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final message =
        FirebaseFirestore.instance.collection("movies").doc(user.email!);
    return Drawer(
        child: FutureBuilder(
            future: getfullname(),
            builder: (context, dynamic snapshot) {
              int i = 0, c = 1;
              while (snapshot.data.docs[i]['email'] != user.email) {
                c = i;
                i++;
                print(i);
              }
              c++;
              // print(
              //     "hwwy" + "${snapshot.data.docs[c]['email']}" + c.toString());
              return ListView(
                padding: EdgeInsets.zero,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text(
                      // "${snapshot.data.docs[i]['full_name']}",
                      "${snapshot.data.docs[c]['full_name']}".toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'gluten',
                          color: Colors.amber),
                    ),
                    accountEmail: Text(
                      user.email!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.white70),
                    ),
                    currentAccountPicture: FutureBuilder(
                        future: downloadImage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData &&
                              snapshot.data != null) {
                            print(snapshot.data);
                            return CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  image: NetworkImage(snapshot.data!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              child: ClipOval(
                                child: Image(
                                  image: AssetImage("assets/images/avatar.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }
                        }),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/backg1.jpg"))),
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text("Favorites"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => favorite()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.watch_later),
                    title: const Text("Watch later"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => watchlater()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text("About App"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Sign out"),
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginpage()));
//               firebase.auth().signOut().then(function() {
//   console.log('Signed Out');
// }, function(error) {
//   console.error('Sign Out Error', error);
// });
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text("Exit App"),
                    onTap: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shower),
                    title: const Text("print"),
                    onTap: () {
                      // print("hey");
                      DocumentReference documentReference = FirebaseFirestore
                          .instance
                          .collection("movie")
                          .doc("movie");
                      documentReference
                          .get()
                          .then((datasnapshot) => datasnapshot.data);
                      //Movie.fromJson(datasnapshot));
                    },
                  ),
                ],
              );
            }));
  }
}
