import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/utils/AppStrings.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../routes/AppRoutes.dart';
import '../../../../utils/AppUtils.dart';
import '../../../../utils/Styles.dart';
import '../../../../utils/bottom_sheet/BottomSheetUtils.dart';
import '../../../../widgets/button/SimpleButtton.dart';
import '../../../submission_successfull/view/page/SubmissionSuccessfullScreen.dart';
import '../../controller/ApplicationSubmissionController.dart';

/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//This screen is created to submit the application details.User will be able to submit the application details here.Some info will be prefilled and other will be fetch from firebase.
//Under the class there are some widgets that has been used recursively inside this screen.
/*---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
class ApplicationSubmissionScreenMobileView extends StatelessWidget {
  ApplicationSubmissionScreenMobileView();

  final ApplicationSubmissionController controller =
      Get.put(ApplicationSubmissionController());

  @override
  Widget build(BuildContext context) {
    controller.fetchUserDetails();
    return Scaffold(
      backgroundColor: Colors.grey[10],
      body: SingleChildScrollView(
          child: Obx(
        () => Stack(
          children: [
            Container(
              height: 180,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildBackButton(context),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildTitle(AppStrings.application_submission),
                  SizedBox(height: 16.0),
                  buildReviewDetails(controller),
                  SizedBox(height: 16.0),
                  buildDescription(
                      AppStrings.we_have_prefilled_your_application),
                  SizedBox(height: 16.0),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.flag_outlined,
                    labelText: AppStrings.service_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.service_type,
                    valueText: controller.serviceType.value,
                  ),
                  buildDataTile(
                    labelText: AppStrings.service_location,
                    valueText: AppStrings.service_region,
                  ),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.person,
                    labelText: AppStrings.personal_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.name,
                    valueText: "Aban Mohammed Abdulla",
                  ),
                  buildDataTile(
                    labelText: AppStrings.emirates_id,
                    valueText: "515165165",
                  ),
                  buildDataTile(
                    labelText: AppStrings.birthday,
                    valueText: "06 june 1978",
                  ),
                  buildDataTile(
                    labelText: AppStrings.marital_status,
                    valueText: "Single",
                  ),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.person,
                    labelText: AppStrings.contact_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.primary_contact_number,
                    valueText: controller.primaryPhoneNumberCountryCode.value +
                        controller.primaryPhoneNumber.value,
                  ),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDataTile(
                    labelText: AppStrings.alternate_contact_number,
                    valueText:
                    controller.alternatePhoneNumber.value == "" ? "" : controller.alternatePhoneNumberCountryCode.value +
                            controller.alternatePhoneNumber.value,
                  ),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildEditButton(context, controller, () {
                    BottomSheetUtils.showBottomSheetForAdditionalNumber(
                        context, controller);
                  }),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDataTile(
                    labelText: AppStrings.referral_name,
                    valueText: controller.referralName.value,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.referral_number,
                    valueText:  controller.referralPhoneNumber.value == "" ? "" : controller.referralPhoneNumberCountryCode.value +
                        controller.referralPhoneNumber.value,
                  ),
                  SizedBox(height: 10.0),
                  buildEditButton(context, controller, () {
                    BottomSheetUtils.showBottomSheetForReferralDetails(
                        context, controller);
                  }),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.home,
                    labelText: AppStrings.family_book_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.town,
                    valueText: "Abu dhabi",
                  ),
                  buildDataTile(
                    labelText: AppStrings.family_number,
                    valueText: "515165165",
                  ),
                  buildDataTile(
                    labelText: AppStrings.number_of_wives,
                    valueText: "1",
                  ),
                  buildDataTile(
                    labelText: AppStrings.number_of_children,
                    valueText: "3",
                  ),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.account_balance_rounded,
                    labelText: AppStrings.employment_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.employer_name,
                    valueText: "SBR Industries",
                  ),
                  buildDataTile(
                    labelText: AppStrings.employment_status,
                    valueText: "Employed",
                  ),
                  buildDataTile(
                    labelText: AppStrings.salary,
                    valueText: "AED 8000",
                  ),
                  SizedBox(height: 20.0),
                  buildDataTile(
                    labelText: AppStrings.employer_name,
                    valueText: "All Travels",
                  ),
                  buildDataTile(
                    labelText: AppStrings.employment_status,
                    valueText: "Employed",
                  ),
                  buildDataTile(
                    labelText: AppStrings.salary,
                    valueText: "AED 10000",
                  ),
                  SizedBox(height: 20.0),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.home,
                    labelText: AppStrings.rental_property_income,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.property_name_1,
                    valueText: "AED 8000",
                  ),
                  SizedBox(height: 20.0),
                  buildDataTile(
                    labelText: AppStrings.property_name_2,
                    valueText: "AED 8000",
                  ),
                  SizedBox(height: 20.0),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.home,
                    labelText: AppStrings.income_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.monthly_gross_income,
                    valueText: "AED 8000",
                  ),
                  SizedBox(height: 20.0),
                  buildDataTile(
                    labelText: AppStrings.estimated_loan_amount,
                    valueText: "AED 8000",
                  ),
                  SizedBox(height: 20.0),
                  buildDivider(),
                  SizedBox(height: Styles.kSizedBoxHeight),
                  buildHeaderTile(
                    icon: Icons.spatial_audio_off_outlined,
                    labelText: AppStrings.spouse_details,
                  ),
                  SizedBox(height: 10.0),
                  buildDataTile(
                    labelText: AppStrings.name,
                    valueText: "Aban Mohammed Abdulla",
                  ),
                  buildDataTile(
                    labelText: AppStrings.emirates_id,
                    valueText: "515165165",
                  ),
                  buildDataTile(
                    labelText: AppStrings.nationality,
                    valueText: "UAE",
                  ),
                  buildDataTile(
                    labelText: AppStrings.birthday,
                    valueText: "06 june 1978",
                  ),
                  SizedBox(height: 20.0),
                  buildDivider(),
                  SizedBox(height: 20.0),
                  SimpleButton(
                      label: AppStrings.continue_txt,
                      onPressed: () {
                        AppUtils.navigateToScreen(
                            context, AppRoutes.submission_success_screen);
                      }),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

Widget buildBackButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 24,
        ),
      ],
    ),
  );
}

Widget buildTitle(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        text,
        style: Styles.kTitleTextStyle,
      ),
    ],
  );
}

Widget buildReviewDetails(ApplicationSubmissionController controller) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40.0),
      topLeft: Radius.circular(10.0),
    ),
    child: Material(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 100.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.review_details,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(AppStrings.please_confirm_personal_details),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: CircularPercentIndicator(
                  radius: 30.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8.0,
                  percent: controller.currentStep.value /
                      controller.totalSteps.value,
                  center: Text(
                    "1/3",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.grey,
                  progressColor: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildEditButton(
    BuildContext context, dynamic controller, Function() onPress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {
          onPress();
        },
        child: Text(
          AppStrings.edit,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}

Widget buildDescription(String text) {
  return Text(
    text,
    style: Styles.kSubtitleTextStyle,
  );
}

Widget buildDivider() {
  return Container(
    height: Styles.kDividerHeight,
    color: Colors.grey,
  );
}

class buildHeaderTile extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final VoidCallback? onTap;
  final bool? isEditShown;

  buildHeaderTile({
    required this.icon,
    required this.labelText,
    this.onTap,
    this.isEditShown,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            SizedBox(width: 8.0),
            Text(
              labelText,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (isEditShown == true)
          InkWell(
            onTap: onTap,
            child: Text(
              AppStrings.edit,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}

class buildDataTile extends StatelessWidget {
  final String labelText;
  final String valueText;

  buildDataTile({required this.labelText, required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            valueText,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
