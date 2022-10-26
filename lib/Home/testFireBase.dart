// ignore_for_file: camel_case_types, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/Movie.dart';

class testfirebase extends StatelessWidget {
  const testfirebase({super.key});
  set d(QueryDocumentSnapshot<Object?> d) {
    print(d['cast'][1]['image']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("geeksforgeeks"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('movies').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                this.d = document;
                return Container(
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      Text(document['title']),
                      Image(image: AssetImage(document['backdrop']))
                    ],
                  )),
                );
              }).toList(),
            );
          }
          return Text("fuuck");
        },
      ),
    );
  }
}
