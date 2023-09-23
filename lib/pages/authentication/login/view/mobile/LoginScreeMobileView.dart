import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/page/RegisterScreen.dart';
import 'package:harvery_solutions_task/pages/services_listing/view/page/ServicesListScreen.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';
import 'package:harvery_solutions_task/utils/SharedPreferencesUtils.dart';

import '../../../../../routes/AppRoutes.dart';
import '../../../../../utils/AppColors.dart';
import '../../../../../utils/AppStrings.dart';
import '../../../../../utils/constants/AppDimensions.dart';
import '../../../../../widgets/button/CustomButton.dart';
import '../../../../../widgets/textfield/TextFormFieldWidget.dart';
import '../../../register/model/UserModel.dart';
import '../../controller/LoginController.dart';

import '../../../../../widgets/loader/LoadingSpinner.dart';



/*-------------------------------------------------------------------------------------------------------*/
//This screen is created to login the user through firebase.
/*-------------------------------------------------------------------------------------------------------*/
class LoginScreenMobileView extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color:AppColors.login_bg_color,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimensions.screenPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: AppDimensions.defaultSpacing),
                Text(
                  AppStrings.login,
                  style: TextStyle(
                    fontSize: AppDimensions.headingFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: AppDimensions.defaultSpacing),
                TextFormFieldWidget(
                  controller: loginController.emailController,
                  labelText: AppStrings.email,
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                  obscureText: false,
                ),
                SizedBox(height: AppDimensions.defaultSpacing),
                TextFormFieldWidget(
                  controller: loginController.passwordController,
                  labelText: AppStrings.password,
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                ),
                SizedBox(height: AppDimensions.defaultSpacing * 2),
                CustomButton(
                    label: AppStrings.sign_in,
                    controller: loginController,
                    onPressed: () {
                      loginController.signInUser(
                        email: loginController.emailController.text,
                        password: loginController.passwordController.text,
                      );
                    }),
                SizedBox(height: AppDimensions.defaultSpacing),
                TextButton(
                  onPressed: () {
                    loginController.emailController.text = "";
                    loginController.passwordController.text = "";

                    AppUtils.navigateToScreen(context, AppRoutes.register_screen);

                  },
                  child: Text(
                    AppStrings.dont_have_an_account,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
