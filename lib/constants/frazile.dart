import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Frazile {
  Frazile._();

  //* Names
  static const String appName = 'AMOLED Wallfy';
  static const String aboutScreen = 'About';
  static const String settingsScreen = 'Settings';
  static const String donateScreen = 'Donate';
  static const String shareTitle = appName;
  static const String shareName = 'AMOLED.jpg';
  static const String shareMsg =
      'AMOLED Wallfy is a huge collection of wallpapers in every sizes available. https://play.google.com/store/apps/details?id=com.fz.AMOLED';

  static const String nointernet = 'No Internet Connection!';
  static const String servererror = 'Server Error!';

  //* DB Settings
  // static const int dbversion = 1;
  // static const String gradientTB = "Gradients";

  //* Error Messages
  String errorMessage;
  getErrorMessage(errorsData) {
    try {
      if (errorsData.response != null) {
        var responseData = json.decode(errorsData.response.toString());
        if (responseData['errors'] != null) {
          var errors = responseData['errors'];
          errors.forEach((k, v) => errorMessage = v[0].toString());
        } else {
          errorMessage = "Server error";
        }
      } else {
        errorMessage = "Server error";
      }
      return errorMessage;
    } catch (e) {
      return "Server error";
    }
  }

  //* SnackBars
  final snackBar = SnackBar(
    content: Text('No Internet Connection!'),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  //* Preferences
  static SharedPreferences prefs;
  static const String darkModePref = "darkModePref";

  //* Fonts
  static const String googleFamily = 'google';

  //* Sizes

  //* Routes
  static const String initial = home;
  static const String home = '/';
  static const String fullScreen = '/fullScreen';
  static const String cat = '/cat';

  //* Image Urls
  static const String profilePic =
      'https://scontent-bom1-2.cdninstagram.com/v/t51.2885-19/s320x320/90319768_530732907836311_5744324372475150336_n.jpg?_nc_ht=scontent-bom1-2.cdninstagram.com&_nc_ohc=TCo-oXAhTgEAX_5gZF2&oh=b8b6f89d78547b35ec368fcccd8dca77&oe=5F306C1D';

  //* Admob Config
  static const String appID = 'ca-app-pub-3595684883769922~7376886208';
  static const String bannerID = 'ca-app-pub-3595684883769922/2802885090';
  static const String interstitialID = 'ca-app-pub-3595684883769922/1106660041';
}
