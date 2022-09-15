import 'package:flutter/material.dart';

class Utils {
  static void routerPush(Widget widget, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
