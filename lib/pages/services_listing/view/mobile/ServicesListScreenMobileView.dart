import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/pages/application_submission/view/mobile/ApplicationSubmissionScreenMobileView.dart';

import '../../../../utils/AppStrings.dart';
import '../../../../utils/constants/AppDimensions.dart';
import '../../../../widgets/button/CustomButton.dart';
import '../../../authentication/login/controller/LoginController.dart';
import '../../controller/ServiceListController.dart';
import '../../model/Service.dart';



/*------------------------------------------------------------------------------------------------------------------------*/
//This file is created to ask user to select any service from list of services and update the selected service to firebase.
/*------------------------------------------------------------------------------------------------------------------------*/

class ServicesListScreenMobileView extends StatelessWidget {
  final ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.pick_service),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: serviceController.services.length,
            itemBuilder: (BuildContext context, int index) {
              final service = serviceController.services[index];

              return GestureDetector(
                onTap: () {
                  serviceController.selectService(service.id);
                },
                child: Obx(
                  () => Card(
                    elevation: AppDimensions.cardElevation,
                    margin: AppDimensions.cardMargin,
                    child: ListTile(
                      title: Text(
                        service.name,
                        style: TextStyle(
                          fontSize: AppDimensions.listItemFontSize,
                          color: serviceController.selectedServiceId.value ==
                                  service.id
                              ? AppDimensions.selectedServiceColor
                              : AppDimensions.defaultServiceColor,
                        ),
                      ),
                      trailing: Radio(
                        activeColor: AppDimensions.selectedServiceColor,
                        value: service.id,
                        groupValue: serviceController.selectedServiceId.value,
                        onChanged: (int? value) {
                          serviceController.selectService(value ?? -1);
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: (AppDimensions.screenPadding)),
        child: CustomButton(
          label: AppStrings.apply_now,
          controller: ServiceController(),
          onPressed: () {
            serviceController.addData();
          },
        ),
      ),
    );
  }
}
