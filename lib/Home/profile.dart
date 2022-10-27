import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class Profile extends StatelessWidget {
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff555555),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 270,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(0, 0, 0, 0)),
                onPressed: () {
                  print("he");
                },
                child: profilewidget(
                  icon: Icons.settings,
                  title: "Setting",
                ),
              ),
              profilewidget(
                icon: Icons.update,
                title: 'Edit',
              ),
              profilewidget(
                icon: Icons.chat,
                title: 'FAQs',
              ),
              profilewidget(
                icon: Icons.share,
                title: 'Share',
              ),
              profilewidget(
                icon: Icons.logout,
                title: 'Log Out',
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       print("ss");
              //     },
              //     child: Text("hey")),
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
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
                style: TextStyle(
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
    Paint paint = Paint()..color = Color(0xff555555);
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
