import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';

import '../../../../../utils/AppColors.dart';
import '../../../../../utils/AppStrings.dart';
import '../../../../../utils/constants/AppDimensions.dart';
import '../../../../../widgets/button/CustomButton.dart';
import '../../../../../widgets/textfield/TextFormFieldWidget.dart';
import '../../controller/RegisterController.dart';
import '../../model/UserModel.dart';



/*-------------------------------------------------------------------------------------------------------*/
//This screen is created to register the user through firebase.
/*-------------------------------------------------------------------------------------------------------*/

class RegisterScreenMobileView extends StatelessWidget {

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

          color:AppColors.login_bg_color,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimensions.defaultSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: AppDimensions.defaultSpacing),
                Text(
                  AppStrings.create_account,
                  style: TextStyle(
                    fontSize: AppDimensions.headingFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: AppDimensions.defaultSpacing),

                TextFormFieldWidget(
                  controller: registerController.nameController,
                  labelText: AppStrings.full_name,
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                  obscureText: false,
                ),

                SizedBox(height: AppDimensions.defaultSpacing),

                TextFormFieldWidget(
                  controller: registerController.emailController,
                  labelText: AppStrings.email,
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                  obscureText: false,
                ),

                SizedBox(height: AppDimensions.defaultSpacing),


                TextFormFieldWidget(
                  controller: registerController.passwordController,
                  labelText: AppStrings.password,
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  obscureText: true,
                ),


                SizedBox(height: AppDimensions.defaultSpacing * 2),



                CustomButton(
                    label: AppStrings.register,
                    controller: registerController,
                    onPressed: () {

                      if(registerController.validateForm(registerController.nameController.text, registerController.emailController.text,registerController.passwordController.text))
                      {
                        registerController.signUpUser();
                      }
                    }),

                SizedBox(height: AppDimensions.defaultSpacing),
                TextButton(
                  onPressed: () {
                    registerController.nameController.text="";
                    registerController.emailController.text="";
                    registerController.passwordController.text="";

                    Navigator.pop(context);
                  },
                  child: Text(
                    AppStrings.already_have_an_account,
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
