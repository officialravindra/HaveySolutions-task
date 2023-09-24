

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../routes/AppRoutes.dart';
import '../../../../utils/AppStrings.dart';
import '../../../../utils/AppUtils.dart';
import '../../../../utils/constants/AppDimensions.dart';
import '../../../../widgets/appbar/CustomAppBar.dart';
import '../../../../widgets/button/SimpleButtton.dart';
import '../../../application_submission/view/page/ApplicationSubmissionScreen.dart';



/*-------------------------------------------------------------------------------------------------------------------------------------*/
//This screen is created to show user how his service selected on the previous screen will work.Currently we have only some content here.
/*-------------------------------------------------------------------------------------------------------------------------------------*/
class HowItWorksScreenMobileView extends StatelessWidget {
  const HowItWorksScreenMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: CustomAppBar(
        title: AppStrings.how_its_works,
        showLeadingIcon: true, // Set to true to show the back arrow
        onPressed: () {
          Navigator.pop(context); // Example: Navigate back
        },
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppStrings.how_its_works_title,
                style: TextStyle(fontSize: AppDimensions.fontSizeLarge),
              ),
              SizedBox(height: AppDimensions.defaultSpacing * 2),
              Text(AppStrings.how_its_works_description),
              SizedBox(height: AppDimensions.defaultSpacing * 2),


              SimpleButton(label: AppStrings.apply_now,onPressed: ()
                {
                  AppUtils.navigateToScreen(
                      context, AppRoutes.application_submission_screen);
                },)
            ],
          ),
        ),
      ),
    );}
}
