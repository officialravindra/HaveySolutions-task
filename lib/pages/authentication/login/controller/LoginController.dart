import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/page/RegisterScreen.dart';
import 'package:harvery_solutions_task/pages/services_listing/view/page/ServicesListScreen.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';
import 'package:harvery_solutions_task/utils/SharedPreferencesUtils.dart';

import '../../../../routes/AppRoutes.dart';
import '../../../../utils/AppStrings.dart';
import '../../../../utils/base/ConnectivityController.dart';
import '../../../services_listing/model/UserDetailsModel.dart';
import '../repository/LoginRepository.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  final firestoreInstance = FirebaseFirestore.instance;
  final LoginRepository _repository = LoginRepository();
  var userId = "".obs;
  Rx<User?> user = Rx<User?>(null);
  ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will push the default user details to the server after user log in.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<void> pushDefaultDetailsToServer() async {
    final jsonData = await AppUtils.loadDataFromJsonFile();
    print(jsonData);

    await firestoreInstance
        .collection(AppStrings.firebase_collection_name)
        .doc(userId.value)
        .set(jsonData);
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will validate data entered by user during log in.
  /*-------------------------------------------------------------------------------------------------------*/
  bool validateForm(String? email, String? password) {
    if (email!.isEmpty) {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.enter_email_address, AppStrings.oops);
      return false;
    } else if (!AppUtils.isValidEmail(email)) {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.enter_valid_email_address, AppStrings.oops);
      return false;
    } else if (password!.isEmpty) {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.enter_password, AppStrings.oops);
      return false;
    } else if (password.length < 6) {
      AppUtils.showSnackbar(Get.context!,
          AppStrings.password_length_validation_message, AppStrings.oops);
      return false;
    }
    return true;
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be called when user data is validated and ready to login.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<void> signInUser(
      {required String? email, required String? password}) async {
    if (isLoading.value) {
      return;
    }

    if (_connectivityController.isOnline.value) {
      try {
        if (validateForm(email, password)) {
          isLoading.value = true;
          final result =
              await _repository.signInUser(email: email, password: password);

          isLoading.value = false;

          if (result is User) {
            user.value = result; // Set the user object in the controller
            userId.value = result.uid;
            SharedPreferencesUtils.saveUserId(result.uid);
            SharedPreferencesUtils.saveUserEmail(email);
            SharedPreferencesUtils.setLoggedIn(true);
            pushDefaultDetailsToServer();
            emailController.text = "";
            passwordController.text = "";
            AppUtils.showSnackbar(
                Get.context!, AppStrings.login_success, AppStrings.success);
            Get.offAll(ServicesListScreen());
          } else if (result is String) {
            if (result.contains("[ INVALID_LOGIN_CREDENTIALS ]")) {
              AppUtils.showSnackbar(Get.context!,
                  AppStrings.invaid_login_credentials, AppStrings.oops);
            } else {
              AppUtils.showSnackbar(Get.context!, result, AppStrings.oops);
            }
          }
        }
      } catch (err) {
        isLoading.value = false;
        AppUtils.showSnackbar(Get.context!, err.toString(), AppStrings.oops);
      }
    } else {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.internet_not_connected, AppStrings.oops);
    }
  }
}
