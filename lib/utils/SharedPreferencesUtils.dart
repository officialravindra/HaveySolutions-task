import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../pages/authentication/login/view/page/LoginScreen.dart';
import 'AppUtils.dart';

/*-------------------------------------------------------------------------------------------------------*/
//This file is created to store all the Shared Preference operations.
/*-------------------------------------------------------------------------------------------------------*/
class SharedPreferencesUtils {


  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to save user id in local storage.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserId(userId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userId', userId.toString());
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to get user id from local storage.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = await preferences.getString('userId') ?? '';
    return userId;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to store logged in status.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> setLoggedIn(loggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('loggedIn', loggedIn);
  }


  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to retrieve logged in status.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<bool> isLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final loggedIn = await preferences.getBool('loggedIn') ?? false;
    return loggedIn;
  }

  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to logout user.
  /*-------------------------------------------------------------------------------------------------------*/
  static void logoutUser() {
    setLoggedIn(false);
    saveUserFirstName('');
    saveUserLastName('');
    saveUserEmail('');
    saveUserMobile('');
    saveUserToken('');
    saveUserId('');

    Navigator.pushAndRemoveUntil(AppUtils().getContext(),MaterialPageRoute(builder: (context) => LoginScreen(),), (r) => false);
  }


  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to save user token.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserToken(token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token.toString());
  }


  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to retrieve user token.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = await preferences.getString('token') ?? '';
    print(token);
    return token;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to save first name.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserFirstName(firstname) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('firstname', firstname.toString());
  }


  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to retrieve user first name.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final firstname = await preferences.getString('firstname') ?? '';
    print(firstname);
    return firstname;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to save last name.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserLastName(lastname) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('lastname', lastname.toString());
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to get last name.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserLastName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final lastname = await preferences.getString('lastname') ?? '';
    print(lastname);
    return lastname;
  }




  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to save email.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserEmail(email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('email', email.toString());
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to get user email.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final email = await preferences.getString('email') ?? '';
    print(email);
    return email;
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to save mobile number.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<void> saveUserMobile(mobile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('desktop', mobile.toString());
  }



  /*-------------------------------------------------------------------------------------------------------*/
  // This function is used to get mobile number.
  /*-------------------------------------------------------------------------------------------------------*/
  static Future<String> getUserMobile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final mobile = await preferences.getString('desktop') ?? '';
    print(mobile);
    return mobile;
  }



}
