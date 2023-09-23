import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/pages/services_listing/model/Service.dart';
import 'package:harvery_solutions_task/pages/services_listing/model/UserDetailsModel.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';
import 'package:harvery_solutions_task/utils/SharedPreferencesUtils.dart';

import '../../../routes/AppRoutes.dart';
import '../../../utils/AppStrings.dart';
import '../../../utils/base/ConnectivityController.dart';
import '../../application_submission/view/mobile/ApplicationSubmissionScreenMobileView.dart';
import '../../how_its_works/view/mobile/HowItWorksScreenMobileView.dart';
import '../../how_its_works/view/page/HowItWorksScreen.dart';
import '../repository/ServiceRepository.dart';
import '../view/mobile/ServicesListScreenMobileView.dart';

class ServiceController extends GetxController {
  final RxInt selectedServiceId = 0.obs;
  final RxString selectedServiceName = "".obs;
  final count = 0.obs;
  RxBool isLoading = false.obs;
  increment() => count.value++;
  final firestoreInstance = FirebaseFirestore.instance;
  final ServiceRepository _serviceRepository = ServiceRepository();
  final ConnectivityController _connectivityController =
      Get.find<ConnectivityController>();
  List<Service> services = [
    Service(1, 'Land Grant Service'),
    Service(2, 'Land Exchange'),
    Service(3, 'House Exchange'),
    Service(4, 'Residential Land Purchase'),
    Service(5, 'House Construction'),
    Service(6, 'House Purchase'),
    Service(7, 'Other loans'),
  ].obs;

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to update the service selected by the user to the firebase.
  /*-------------------------------------------------------------------------------------------------------*/

  Future<void> addData() async {
    if (_connectivityController.isOnline.value) {
      isLoading.value = true;

      String userId = await SharedPreferencesUtils.getUserId();

      try {
        await _serviceRepository.updateServiceType(
            userId, selectedServiceName.value);

        isLoading.value = false;

        AppUtils.navigateToScreen(
            AppUtils().getContext(), AppRoutes.how_its_works_screen);
      } catch (e) {
        isLoading.value = false;
        // Handle the error as needed
      }
    } else {
      AppUtils.showSnackbar(
          Get.context!, AppStrings.internet_not_connected, AppStrings.oops);
    }
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to select any service from all services.
  /*-------------------------------------------------------------------------------------------------------*/
  void selectService(int id) {
    selectedServiceId.value = id;
    final selectedService = services.firstWhere(
      (service) => service.id == selectedServiceId.value,
      orElse: () => Service(-1, 'No service selected'),
    );
    print('Selected service: ${selectedService.name}');
    selectedServiceName.value = selectedService.name;
  }
}
