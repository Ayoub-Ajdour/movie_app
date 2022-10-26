import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Details/components/BackdropAndRating.dart';
import 'package:movie_app/Details/components/CastAndCrew.dart';
import 'package:movie_app/Details/components/Genres.dart';
import 'package:movie_app/Details/components/TitleDurationAndFabBtn.dart';
import 'package:movie_app/Details/details_screen.dart';
import 'package:movie_app/Home/Movie.dart';

// ignore: camel_case_types
class genresmovies extends StatelessWidget {
  const genresmovies({Key? key, required int i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _hasBeenPressed = false;
    bool _flag = true;
    @override
    void initState() {
      // super.initState();
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      //   title: Text("Watch Later"),
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('genre').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((document) {
                print("jjjjjjjjjj");
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                      child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 0, 0)),
                          ),
                          onPressed: () {},
                          child: Text(document['1']),
                        ),
                        style: ElevatedButton.styleFrom(
                            // backgroundColor: _flag
                            //     ? Colors.red
                            //     : Colors.teal, // This is what you need!
                            ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5, // 5 padding top and bottom
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 0, 0, 0)),
                          ),
                          onPressed: () {},
                          child: Text(document['1']),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        document['1'],
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
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
