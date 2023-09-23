import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harvery_solutions_task/utils/AppStrings.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';

import '../../../../utils/constants/AppDimensions.dart';
import '../../../../widgets/alert/CustomSimpleAlertDialogueBox.dart';
import '../../../../widgets/button/SimpleButtton.dart';
import '../../../application_submission/view/page/ApplicationSubmissionScreen.dart';


/*-------------------------------------------------------------------------------------------------------*/
//This screen is created to show user that his or her application is successfully submitted.
/*-------------------------------------------------------------------------------------------------------*/
class SubmissionSuccessfullScreenMobileView extends StatelessWidget {
  const SubmissionSuccessfullScreenMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.application_submitted),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppStrings.application_submitted_successfully,
                style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
              ),
              SizedBox(height: AppDimensions.defaultSpacing * 2),
              Text(AppStrings.application_submitted_description),
              SizedBox(height: AppDimensions.defaultSpacing * 2),
              SimpleButton(
                label: AppStrings.logout,
                onPressed: () {
                  AppUtils.showLogoutDialog(AppUtils().getContext());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
