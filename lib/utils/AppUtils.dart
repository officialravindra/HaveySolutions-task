/*******************************
 * Author : Ravindra
 * Purpose : Utility class for checking isNumeric, isNull, GetCurrent Date Time,
 * Show logs on console, Alert messages etc.
 ********************************/

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../pages/authentication/login/view/page/LoginScreen.dart';
import '../pages/services_listing/view/page/ServicesListScreen.dart';
import '../utils/AppColors.dart';
import '../utils/AppStrings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../widgets/alert/CustomSimpleAlertDialogueBox.dart';
import 'SharedPreferencesUtils.dart';

/*-------------------------------------------------------------------------------------------------------*/
//This file is used to store utils functions.
/*-------------------------------------------------------------------------------------------------------*/
class AppUtils {

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to check null or empty values.
  /*-------------------------------------------------------------------------------------------------------*/
  static bool isNull(String? content) {
    return content == null || content.isEmpty;
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to validate email.
  /*-------------------------------------------------------------------------------------------------------*/
  static bool isValidEmail(String? email) {
    if (email == null) {
      return false;
    }
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }


  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to compare 2 strings.
  /*-------------------------------------------------------------------------------------------------------*/
  static bool compareStrings(String str1, String str2) {
    return str1 == str2;
  }

  static final RegExp numericRegExp = RegExp(r'^[0-9]*$'); // Regular expression
  static final RegExp alphabeticRegExp =
      RegExp(r'[0-9]'); // Regular expression to match alphabetic input



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to validate referral name.
  /*-------------------------------------------------------------------------------------------------------*/
  static bool validateReferralName(String value) {
    int minLength = 3;
    int maxLength = 50;

    int length = value.length;

    return length >= minLength && length <= maxLength;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to validate name.
  /*-------------------------------------------------------------------------------------------------------*/
  static bool isNameContainsAlphabetsOnly(String? name) {
    if (name == null) {
      return false;
    }

   // final RegExp alphabeticRegex = RegExp(r'^[A-Za-z]+$');
    final RegExp alphabeticRegex = RegExp(r'^[A-Za-z\s]+$');
    return alphabeticRegex.hasMatch(name);

  }


  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to show snackbar.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showSnackbar(BuildContext context, String message, String title) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[800],
      colorText: Colors.white,
    );
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to show toast.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showToast(String? msg) {
    Fluttertoast.showToast(msg: msg!);
  }

  static void log(msg) {
    debugPrint(msg);
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to show alert dialog.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showLogoutDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        AppUtils.logoutUser(context);
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Logout"),
      content: Text("Are you sure you want to logout? "),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to logout user.
  /*-------------------------------------------------------------------------------------------------------*/
  static void logoutUser(BuildContext context) {
    SharedPreferencesUtils.logoutUser();
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to load json file.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<Map<String, dynamic>> loadDataFromJsonFile() async {
    final jsonString =
        await rootBundle.loadString('assets/json/UserDetails.json');
    final jsonData = json.decode(jsonString);
    return jsonData;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to check internet connection.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<bool> hasInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    return isConnected;
  }


  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to return context.
  /*-------------------------------------------------------------------------------------------------------*/
  BuildContext getContext() {
    BuildContext? currentContext = Get.context;
    return currentContext as BuildContext;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to navigate a user from splash screen.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> navigateFromSplashScreen() async {
    bool isLoggedIn = await SharedPreferencesUtils.isLoggedIn();

    if (isLoggedIn) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(AppUtils().getContext(),
              MaterialPageRoute(builder: (context) => ServicesListScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(AppUtils().getContext(),
              MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to show custom dialog.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showCustomDialog(BuildContext context, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomSimpleAlertDialougeBox(descriptions: description);
      },
    );
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to navigate user from one screen to another.
  /*-------------------------------------------------------------------------------------------------------*/
  static void navigateToScreen(BuildContext context, String screen) {
    Navigator.pushNamed(context, screen);
  }
}
