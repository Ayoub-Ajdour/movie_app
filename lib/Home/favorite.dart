import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Details/components/BackdropAndRating.dart';
import 'package:movie_app/Details/components/CastAndCrew.dart';
import 'package:movie_app/Details/components/Genres.dart';
import 'package:movie_app/Details/components/TitleDurationAndFabBtn.dart';
import 'package:movie_app/Details/details_screen.dart';
import 'package:movie_app/Home/Movie.dart';

class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade300,
        title: Text("favorite"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('favorite').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                // print("jjjjjjjjjj");
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Center(
                        child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child:
                                Image(image: AssetImage(document['backdrop']))),
                        Text(
                          document['title'],
                          style: TextStyle(
                              fontFamily: 'Peralta-Regular',
                              fontSize: 30,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          document['dateAdd'],
                          style: TextStyle(
                              color: Colors.blueGrey.shade200,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    )),
                  ),
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
