import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils{
  static Future<bool> readUserInfoFromSp() async {
    final prefs = await SharedPreferences.getInstance();

    var userid = prefs.getString('userId') ?? "";
    var token = prefs.getString('token') ?? "";
    var username = prefs.getString('userName') ?? "";

    if (username.isEmpty || token.isEmpty || userid.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> showToast(
      String msg,
      Color backgroundColor,
      Color textColor,
      ) async {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: backgroundColor,
      textColor: textColor,
      gravity: ToastGravity.TOP,
    );
  }


  static Future<void> setUserIntoCache(String userId, String token, String userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('token', token);
    prefs.setString('userName', userName);
  }


  static Future<void> removeUserInfoFromSp() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('token');
    prefs.remove('userName');
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }

}


enum myColorPool {
  blue,
  purple,
  lightBlue,
  green,
  yellow,
  pink,
  mainColor,
  backgroundColor,
  percentageColor,
  unoccupiedColor,
  logoutIconColor,
  loginbackgroundColor,

  // toastColor
  toastBackgroundWarningColor,
  toastTextWarningColor,
  toastBackgroundErrorColor,
  toastTextErrorColor,
  toastBackgroundSuccColor,
  toastTextBlueSuccColor;

  Color hexCode() {
    switch (this) {
      case blue:
        return Color(0xfff0075FF);
      case purple:
        return Color(0xfff5C16FF);
      case lightBlue:
        return Color(0xfff0075FF);
      case green:
        return Color(0xfff26CF42);
      case yellow:
        return Color(0xfffFFB31C);
      case pink:
        return Color(0xfffFF4CB1);
      case percentageColor:
        return Color(0xfff80858D);
      case logoutIconColor:
        return Color(0xfff80858D);
      case mainColor:
        return Colors.white;
      case backgroundColor:
        return Color(0xfffF5F5F5);
      case unoccupiedColor:
        return Color(0xfffF3F3F3);
      case loginbackgroundColor:
        return Color(0xfff030C2F);
      case toastTextBlueSuccColor:
        return const Color(0xFFE6F3FF);
      case toastBackgroundSuccColor:
        return const Color(0xFF007AFF);
      case toastTextErrorColor:
        return const Color(0xFFFFE6E6);
      case toastBackgroundErrorColor:
        return const Color(0xFFFF3333);
      case toastBackgroundWarningColor:
        return Colors.orange;
      case toastTextWarningColor:
        return const Color(0xFFFFF9C4);
    }
  }
}
