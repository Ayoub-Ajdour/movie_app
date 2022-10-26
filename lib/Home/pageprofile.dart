import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/Edit.dart';
import 'package:movie_app/Home/home.dart';
import 'package:movie_app/Home/setting.dart';

class pageprofile extends StatelessWidget {
  const pageprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

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
              MaterialPageRoute(builder: (context) => const home()),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 270,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const setting()),
                  );
                },
                child: const profilewidget(
                  icon: Icons.settings,
                  title: "Setting",
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const edit()),
                  );
                },
                child: const profilewidget(
                  icon: Icons.update,
                  title: 'Edit',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {},
                child: const profilewidget(
                  icon: Icons.chat,
                  title: 'FAQs',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {},
                child: const profilewidget(
                  icon: Icons.share,
                  title: 'Share',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const profilewidget(
                  icon: Icons.logout,
                  title: 'Log Out',
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       print("ss");
              //     },
              //     child: Text("hey")),
            ],
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
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 35,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${snapshot.data.docs[c]['full_name']}".toUpperCase(),
                          style: const TextStyle(
                              fontSize: 25,
                              fontFamily: 'Gluten',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const SizedBox(
                            height: 20,
                            width: 20,
                            child: Image(
                                image: AssetImage("assets/images/veref.png")))
                      ],
                    ),
                    Text(
                      user.email.toString(),
                      style: TextStyle(color: Colors.blueGrey[700]),
                    ),
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 270, left: 184),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
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
