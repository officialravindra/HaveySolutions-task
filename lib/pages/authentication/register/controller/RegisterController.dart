import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/AppStrings.dart';
import '../../../../utils/AppUtils.dart';

import '../../../../utils/base/ConnectivityController.dart';
import '../model/UserModel.dart';
import '../repository/RegisterRepository.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RegisterRepository _repository = RegisterRepository();
  final RxBool isLoading = false.obs;

  ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will validate data entered by user during registration process.
  /*-------------------------------------------------------------------------------------------------------*/
  bool validateForm(String name, String email, String password) {
    if (name.isEmpty) {
      AppUtils.showSnackbar(
          AppUtils().getContext(), AppStrings.enter_name, AppStrings.oops);
      return false;
    } else if (email.isEmpty) {
      AppUtils.showSnackbar(AppUtils().getContext(),
          AppStrings.enter_email_address, AppStrings.oops);
      return false;
    } else if (!AppUtils.isValidEmail(email)) {
      AppUtils.showSnackbar(AppUtils().getContext(),
          AppStrings.enter_valid_email_address, AppStrings.oops);
      return false;
    } else if (password.isEmpty) {
      AppUtils.showSnackbar(
          AppUtils().getContext(), AppStrings.enter_password, AppStrings.oops);
      return false;
    } else if (password.length < 6) {
      AppUtils.showSnackbar(AppUtils().getContext(),
          AppStrings.password_length_validation_message, AppStrings.oops);
      return false;
    }

    // If all conditions are met, return true
    return true;
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be called when user data is validated and ready to register.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<void> signUpUser() async {
    print(_connectivityController.isOnline.value);
    if (isLoading.value) {
      return;
    }

    if (_connectivityController.isOnline.value) {
      isLoading.value = true;
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      if (validateForm(name, email, password)) {
        final result = await _repository.signUpUser(
          name: name,
          email: email,
          password: password,
        );

        isLoading.value = false;

        if (result == AppStrings.success) {
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          Navigator.pop(AppUtils().getContext());
        }
      }

      isLoading.value = false;
    } else {
      AppUtils.showSnackbar(AppUtils().getContext(),
          AppStrings.internet_not_connected, AppStrings.oops);
    }
  }
}
