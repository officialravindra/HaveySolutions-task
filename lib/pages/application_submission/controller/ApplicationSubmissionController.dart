import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/utils/AppStrings.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';

import '../../../utils/SharedPreferencesUtils.dart';
import '../../../utils/base/ConnectivityController.dart';
import '../repository/ApplicationSubmissionRepository.dart';

class ApplicationSubmissionController extends GetxController {
  RxInt currentStep = 1.obs;
  RxInt totalSteps = 3.obs;
  RxString screenHeading = "Application Submission".obs;
  RxString serviceType = "Land Grant".obs;
  RxString selectedMunicipality = "".obs;
  RxString selectedRegion = "Abu Dhabi".obs;
  final List<String> countryCodes =
      ["+1", "+44", "+91", "+86", "+971"].obs; // Add your country codes here
  var selectedCodeForAlternateNumber = "+971".obs;
  var selectedCodeForReferralNumber = "+971".obs;

  TextEditingController primaryPhoneNumberController = TextEditingController();
  TextEditingController alternatePhoneNumberController =
      TextEditingController();
  TextEditingController referralPhoneNumberController = TextEditingController();
  TextEditingController referralNameController = TextEditingController();
  RxString primaryPhoneNumber = "".obs;
  RxString primaryPhoneNumberCountryCode = "".obs;
  RxString alternatePhoneNumber = "".obs;
  RxString alternatePhoneNumberCountryCode = "".obs;
  RxString referralPhoneNumber = "".obs;
  RxString referralPhoneNumberCountryCode = "".obs;
  RxString referralName = "".obs;
  final repository = ApplicationSubmissionRepository();
  ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();
  @override
  Future<void> onInit() async {
    super.onInit();
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function calculated the color to be shown in progress bar indicator.
  /*-------------------------------------------------------------------------------------------------------*/
  Color getProgressColor() {
    // Define your logic to determine the color based on currentStep and totalSteps
    double progress = currentStep.value / totalSteps.value;

    if (progress <= 0.2) {
      return Colors.red;
    } else if (progress <= 0.4) {
      return Colors.orange;
    } else if (progress <= 0.6) {
      return Colors.yellow;
    } else if (progress <= 0.8) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }




  /*----------------------------------------------------------------------------------------------------------------------------------------*/
  //This function will fetch the details of the user of the firebase.We have used only some data from firebase others are taken as static.
  /*----------------------------------------------------------------------------------------------------------------------------------------*/
  Future<void> fetchUserDetails() async {
    if (_connectivityController.isOnline.value) {
      try {
        final userData = await repository.fetchUserDetails();
        if (userData != null) {
          print(userData);

          primaryPhoneNumber.value = userData['contact_information']
              ['primary_number']['mobile_number'];
          primaryPhoneNumberCountryCode.value =
              userData['contact_information']['primary_number']['country_code'];
          alternatePhoneNumber.value = userData['contact_information']
              ['alternate_number']['mobile_number'];
          alternatePhoneNumberCountryCode.value =
              userData['contact_information']['alternate_number']
                  ['country_code'];
          referralName.value = userData['referral_details']['referral_name'];
          referralPhoneNumber.value =
              userData['referral_details']['referral_number']['mobile_number'];
          referralPhoneNumberCountryCode.value =
              userData['referral_details']['referral_number']['country_code'];
          serviceType.value = userData['service_details']['service_type'];
          referralNameController.text =
              userData['referral_details']['referral_name'];
          referralPhoneNumberController.text =
              userData['referral_details']['referral_number']['mobile_number'];
          alternatePhoneNumberController.text = userData['contact_information']
              ['alternate_number']['mobile_number'];

        } else {
          print('User not found in Firestore.');
        }
      } catch (e) {
        print('Error fetching user details: $e');
      }
    } else {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.internet_not_connected, AppStrings.oops);
    }
  }



  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to update the data to the firebase.
  /*-------------------------------------------------------------------------------------------------------*/

  Future<void> updateData({
    required String fieldToUpdate,
    required dynamic newValue,
  }) async {
    if (_connectivityController.isOnline.value) {
      try {
        String userId = await SharedPreferencesUtils.getUserId();
        await repository.updateUserData(
            userId: userId, fieldToUpdate: fieldToUpdate, newValue: newValue);

        // Update was successful
        AppUtils.showSnackbar(AppUtils().getContext(),
            AppStrings.details_updated_successfully, AppStrings.success);
        Navigator.pop(AppUtils().getContext());
      } catch (e) {
        // Handle errors...
        print('Error updating document: $e');
        AppUtils.showSnackbar(AppUtils().getContext(),
            AppStrings.something_went_wrong, AppStrings.oops);
      }
    } else {
      AppUtils.showSnackbar(AppUtils().getContext(),
          AppStrings.internet_not_connected, AppStrings.oops);
    }
  }
}
