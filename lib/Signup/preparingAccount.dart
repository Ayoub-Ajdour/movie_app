// ignore_for_file: unused_import, use_key_in_widget_constructors, avoid_print, prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Home/home.dart';

// ignore: camel_case_types, must_be_immutable
class preparingAccount extends StatefulWidget {
  late String name, email, phone, password, uid;

  preparingAccount(this.name, this.email, this.phone, this.password, this.uid) {
    // print(
    //     'HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEY' + name + email + phone + password);
  }

  @override
  HomePage createState() => HomePage(name, email, phone, password, uid);
}

class HomePage extends State<preparingAccount> {
  final formKey = GlobalKey<FormState>();

  late String namee, emaill, phonee, passwordd, uid;

  HomePage(this.namee, this.emaill, this.phonee, this.passwordd, this.uid) {}
  final namemoviecontroller = TextEditingController();
  String? selectedValue;
  String? selectedValuee;
  final List<String> items = [
    'Chose your favorite category ',
    'ACTION',
    'COMEDY',
    'ADVENTURE',
    'ROMANTIC',
    'Item6',
    'Item7',
    'Item8',
  ];
  final List<String> itemss = [
    'Chose your favorite Production company  ',
    'MARAVEL',
    'Warner Bros',
    'Sony',
    '20th Century Fox',
    'Paramount Pictures',
    'Lionsgate Films',
    'The Weinstein Company',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          padding: EdgeInsets.zero,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Image(image: AssetImage("assets/images/111.png")),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Colors.yellow,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: const Color.fromARGB(95, 128, 128, 124),
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 40, right: 40),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  // dropdownPadding: const EdgeInsets.only(left: 40, right: 40),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromARGB(0, 128, 128, 124),
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            /////////////////////////////////////////////////////
            const SizedBox(height: 30),
            ////////////////////////////////////////////////////

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  // hint: Row(
                  //   children: const [
                  //     Icon(
                  //       Icons.list,
                  //       size: 16,
                  //       color: Colors.yellow,
                  //     ),
                  //     SizedBox(
                  //       width: 4,
                  //     ),
                  //     Expanded(
                  //       child: Text(
                  //         'Select Item',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.yellow,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  items: itemss
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                  value: selectedValuee,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValuee = value as String;
                    });
                  },

                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 30,
                  iconEnabledColor: Colors.yellow,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: const Color.fromARGB(95, 128, 128, 124),
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 200,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color.fromARGB(0, 128, 128, 124),
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              // child: TextField(
              //   // autofocus: false,

              //   controller: namemoviecontroller,
              //   cursorColor: const Color.fromARGB(255, 59, 67, 29),

              //   textInputAction: TextInputAction.next,
              //   decoration: InputDecoration(
              //     fillColor: const Color.fromARGB(95, 128, 128, 124),
              //     hintText: "Full Name",
              //     prefixIcon: Padding(
              //       padding: const EdgeInsets.all(1),
              //     ),
              //     contentPadding: EdgeInsets.all(200.0),
              //   ),
              // ),
              child: TextFormField(
                controller: namemoviecontroller,
                textInputAction: TextInputAction.next,
                cursorColor: const Color.fromARGB(255, 59, 67, 29),
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(95, 128, 128, 124),
                  border: UnderlineInputBorder(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(20),
                  ),
                  labelText: 'Enter name of your Best Movie',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(241, 104, 69, 39)),
                onPressed: () {
                  addUser();
                },
                label: Text(
                  'Save',
                  style: const TextStyle(fontSize: 24),
                ),
                icon: Icon(
                  Icons.save,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future addUser() async {
    print(uid +
        emaill +
        phonee +
        namemoviecontroller.text +
        selectedValue.toString() +
        selectedValuee.toString());
    final messageRef =
        FirebaseFirestore.instance.collection("type_user").doc("0");
    final docUser = FirebaseFirestore.instance.collection('users').doc(emaill);
    //id = docUser.id;
    final json = {
      'id': uid,
      'full_name': namee,
      'email': emaill,
      'type': messageRef,
      'phone_number': phonee,
      'best_movie': namemoviecontroller.text,
      'favorite_category': selectedValue.toString(),
      'favorite_pc': selectedValuee.toString(),
    };
    docUser.set(json);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const home()));
  }
}
