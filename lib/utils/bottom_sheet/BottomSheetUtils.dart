import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../pages/application_submission/controller/ApplicationSubmissionController.dart';
import '../AppStrings.dart';
import '../AppUtils.dart';

/*----------------------------------------------------------------------------------------------------------------------------------*/
//This file is created to showcase bottomsheets in app.we have created 2 bottomsheets for referral details and alternate phone number.
/*----------------------------------------------------------------------------------------------------------------------------------*/

class BottomSheetUtils {
  /*-------------------------------------------------------------------------------------------------------*/
  //This function will show bottom sheet for referral details.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showBottomSheetForReferralDetails(
      BuildContext context, ApplicationSubmissionController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            color: Colors.white,
            height: MediaQuery.sizeOf(context).height - 60,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.phone_android,
                            size: 35,
                          ),
                          onPressed: () {
                            // Add action for mobile icon
                          },
                          color: Colors.white, // Set the icon color to white
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppStrings.edit_referral_details,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    child: TextFormField(
                      controller: controller.referralNameController,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        // FilteringTextInputFormatter.allow(
                        //     AppUtils.alphabeticRegExp),
                      ],
                      onChanged: (value) {
                        setState(() {
                          controller.referralName.value = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.enter_referral_name,
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Container(
                          width: 80.0, // Adjust the width as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller
                                  .selectedCodeForReferralNumber.value,
                              onChanged: (String? newValue) {
                                controller.selectedCodeForReferralNumber.value =
                                    newValue!;
                                controller.referralPhoneNumberCountryCode
                                    .value = newValue!;
                              },
                              items: controller.countryCodes.map((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(code),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            controller:
                                controller.referralPhoneNumberController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.referralPhoneNumber.value = value;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(AppUtils
                                  .numericRegExp), // Allow only numeric input
                            ],
                            decoration: InputDecoration(
                              hintText: AppStrings.enter_mobile_number,
                              contentPadding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {

                          if (AppUtils.isNull(controller.referralName.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_name_cant_be_empty,
                                AppStrings.oops);
                          } else if (!AppUtils.isNameContainsAlphabetsOnly(
                              controller.referralName.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_name_letters_validation_message,
                                AppStrings.oops);
                          } else if (!AppUtils.validateReferralName(
                              controller.referralName.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_name_validation_message,
                                AppStrings.oops);
                          } else if (AppUtils.isNull(
                              controller.referralPhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_number_cant_be_empty,
                                AppStrings.oops);
                          } else if (AppUtils.compareStrings(
                              controller.primaryPhoneNumberCountryCode.value +
                                  controller.primaryPhoneNumber.value,
                              controller.referralPhoneNumberCountryCode.value +
                                  controller.referralPhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_and_primary_cant_be_same,
                                AppStrings.oops);
                          } else if (AppUtils.compareStrings(
                              controller.alternatePhoneNumberCountryCode.value +
                                  controller.alternatePhoneNumber.value,
                              controller.referralPhoneNumberCountryCode.value +
                                  controller.referralPhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.referral_and_alternate_cant_be_same,
                                AppStrings.oops);
                          } else {
                            var data = {
                              AppStrings.referral_name_key:
                                  controller.referralName.value,
                              AppStrings.referral_number_key: {
                                AppStrings.country_code_key: controller
                                    .selectedCodeForReferralNumber.value,
                                AppStrings.mobile_number_key:
                                    controller.referralPhoneNumber.value,
                              },
                            };

                            controller.updateData(
                              fieldToUpdate: AppStrings.referral_details_key,
                              newValue: data,
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 32,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors
                                .black, // Set the background color to black
                            borderRadius: BorderRadius.circular(
                                25.0), // Set the border radius
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.done,
                              style: TextStyle(
                                color:
                                    Colors.white, // Set the text color to white
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      controller.fetchUserDetails();
    });
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will show bottom sheet for alternate number.
  /*-------------------------------------------------------------------------------------------------------*/
  static void showBottomSheetForAdditionalNumber(
      BuildContext context, ApplicationSubmissionController controller) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            color: Colors.white,
            height: MediaQuery.sizeOf(context).height - 60,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.phone_android,
                            size: 35,
                          ),
                          onPressed: () {
                            // Add action for mobile icon
                          },
                          color: Colors.white, // Set the icon color to white
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 18,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppStrings.edit_alternate_number,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Container(
                          width: 80.0, // Adjust the width as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller
                                  .selectedCodeForAlternateNumber.value,
                              onChanged: (String? newValue) {
                                controller.selectedCodeForAlternateNumber
                                    .value = newValue!;
                                controller.alternatePhoneNumberCountryCode
                                    .value = newValue!;
                              },
                              items: controller.countryCodes.map((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(code),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(AppUtils
                                  .numericRegExp), // Allow only numeric input
                            ],
                            controller:
                                controller.alternatePhoneNumberController,
                            onChanged: (value) {
                              controller.alternatePhoneNumber.value = value;
                            },
                            decoration: InputDecoration(
                              hintText: AppStrings.enter_mobile_number,
                              contentPadding: EdgeInsets.all(8.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (AppUtils.isNull(
                              controller.alternatePhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.alternate_number_cant_be_empty,
                                AppStrings.oops);
                          } else if (AppUtils.compareStrings(
                              controller.primaryPhoneNumberCountryCode.value +
                                  controller.primaryPhoneNumber.value,
                              controller.alternatePhoneNumberCountryCode.value +
                                  controller.alternatePhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.alternate_and_primary_cant_be_same,
                                AppStrings.oops);
                          } else if (AppUtils.compareStrings(
                              controller.alternatePhoneNumberCountryCode.value +
                                  controller.alternatePhoneNumber.value,
                              controller.referralPhoneNumberCountryCode.value +
                                  controller.referralPhoneNumber.value)) {
                            AppUtils.showSnackbar(
                                AppUtils().getContext(),
                                AppStrings.alternate_and_referral_cant_be_same,
                                AppStrings.oops);
                          } else {
                            var data = {
                              AppStrings.country_code_key: controller
                                  .selectedCodeForAlternateNumber.value,
                              AppStrings.mobile_number_key:
                                  controller.alternatePhoneNumber.value,
                            };

                            controller.updateData(
                              fieldToUpdate: AppStrings.alternate_number_key,
                              newValue: data,
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.sizeOf(context).width - 32,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors
                                .black, // Set the background color to black
                            borderRadius: BorderRadius.circular(
                                25.0), // Set the border radius
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.done,
                              style: TextStyle(
                                color:
                                    Colors.white, // Set the text color to white
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      controller.fetchUserDetails();
    });
  }
}
