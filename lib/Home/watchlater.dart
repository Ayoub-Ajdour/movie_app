import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Details/components/BackdropAndRating.dart';
import 'package:movie_app/Details/components/CastAndCrew.dart';
import 'package:movie_app/Details/components/Genres.dart';
import 'package:movie_app/Details/components/TitleDurationAndFabBtn.dart';
import 'package:movie_app/Details/details_screen.dart';
import 'package:movie_app/Home/Movie.dart';

class watchlater extends StatelessWidget {
  const watchlater({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade300,
        title: Text("Watch Later"),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('watchlatter').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                print("jjjjjjjjjj");
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
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(fontWeight: FontWeight.w600),
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
