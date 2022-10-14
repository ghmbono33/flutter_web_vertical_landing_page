import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Para que se pueda hacer Scroll en Flutter Web con PageView
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
