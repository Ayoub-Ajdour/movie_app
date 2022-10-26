// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );
  }
}
