import 'package:AMOLED/constants/frazile.dart';
import 'package:AMOLED/pages/fullscreen/fullScreen.dart';
import 'package:AMOLED/pages/home/homePage.dart';
import 'package:AMOLED/pages/singlecat/cat.dart';
import 'package:flutter/material.dart';

class Routes {
  /// Setting the routes screens
  static Map<String, Widget Function(BuildContext)> routes() => {
        Frazile.home: (ctx) => HomePage(),
        Frazile.fullScreen: (ctx) => FullScreen(),
        Frazile.cat: (ctx) => Cat(),
      };
}
