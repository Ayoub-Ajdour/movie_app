import 'package:flutter/material.dart';
import 'package:movie_app/Home/Actors.dart';
import 'package:movie_app/Home/home.dart';

class CastAndCrew extends StatelessWidget {
  final int casts;
  final int directors;
  const CastAndCrew({Key? key, required this.casts, required this.directors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          const Text(
            "DIRECTORS",
            style: TextStyle(fontSize: 14, color: Color.fromARGB(129, 0, 0, 0)),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 160,
            child: FutureBuilder(
                future: getdata(),
                builder: (context, dynamic snapshot) {
                  if (snapshot.hasData) {
                    // print("${snapshot.data.docs[directors]['director'].length}");
                    // print('heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey' +
                    //     "${snapshot.data.docs[directors]['director'][1]['orginalName']}");
                    return PageView.builder(
                      // controller: _pageController,
                      itemCount:
                          snapshot.data.docs[directors]['director'].length,
                      itemBuilder: (context, index) => Container(
                        //    margin: const EdgeInsets.only(right: 50),
                        //width: 70,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 90,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "${snapshot.data.docs[directors]['director'][index]['image']}",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "${snapshot.data.docs[directors]['director'][index]['orginalName']}",
                                //textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                                maxLines: 2,
                              ),
                            ]),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          //actors
          const Text(
            "ACTORS",
            style: TextStyle(fontSize: 14, color: Color.fromARGB(129, 0, 0, 0)),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 160,
            child: FutureBuilder(
                future: getdata(),
                builder: (context, dynamic snapshot) {
                  if (snapshot.hasData) {
                    // print("${snapshot.data.docs[directors]['director'].length}");
                    // print('heeeeeeeeeeeeeeeeeeeeeeeeeeeeeeey' +
                    //     "${snapshot.data.docs[directors]['director'][1]['orginalName']}");
                    return PageView.builder(
                        // controller: _pageController,
                        itemCount: snapshot.data.docs[directors]['cast'].length,
                        itemBuilder: (context, index) => Container(
                              //    margin: const EdgeInsets.only(right: 50),
                              //width: 70,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 90,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "${snapshot.data.docs[directors]['cast'][index]['image']}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      "${snapshot.data.docs[directors]['cast'][index]['orginalName']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      "${snapshot.data.docs[directors]['cast'][index]['movieName']}",
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade300,
                                          fontSize: 15),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: 30,
                                  ),
                                ],
                              ),
                            ));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ]));
  }
}

class CastCardD extends StatelessWidget {
  const CastCardD({super.key, required this.cast});
  final Map cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 50),
      width: 90,
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            // width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          // Text(
          //   cast['movieName'],
          //   style: TextStyle(
          //       color: Colors.brown.shade700, fontWeight: FontWeight.bold),
          //   textAlign: TextAlign.center,
          //   // style: Theme.of(context).textTheme.bodyText2,
          //   maxLines: 2,
          // ),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

//

class CastCardDerector extends StatelessWidget {
  const CastCardDerector({super.key, required this.director});
  final Map director;

  @override
  Widget build(BuildContext context) {
    return Container(
      //    margin: const EdgeInsets.only(right: 50),
      //width: 70,
      child: Row(
        children: <Widget>[
          Container(
            height: 90,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  director['image'],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            director['orginalName'],
            //textAlign: TextAlign.center,
            // style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
