
import 'package:flutter/material.dart';

mixin NavigatorManager {
  void navigateToPushWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  void navigateToPopWidget(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateToPushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }
}