// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void showToast({
    required String message,
    bool isFromMobile = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.deepPurple,
      gravity: isFromMobile ? ToastGravity.BOTTOM : ToastGravity.TOP,
      webPosition: 'center',
      webBgColor: '#673AB7',
      textColor: Colors.white,
    );
  }
}
