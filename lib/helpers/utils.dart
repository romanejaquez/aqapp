import 'package:flutter/material.dart';

class Utils {

  static void showModal(BuildContext context, Widget widget, {bool dismiss = true }) {
    showDialog(context: context,
      barrierDismissible: dismiss,
      builder: (BuildContext cxt) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: widget
      );
    });
  }
}