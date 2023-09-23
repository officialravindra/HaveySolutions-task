import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/AppDimensions.dart';
import '../loader/LoadingSpinner.dart';

/*-------------------------------------------------------------------------------------------------------*/
// This widget will show custom button used in app..
/*-------------------------------------------------------------------------------------------------------*/
class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  var   controller;


  CustomButton({
    required this.label,
    required this.onPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller.isLoading.value ? null : onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width - (2 * AppDimensions.screenPadding),
        height: AppDimensions.buttonHeight,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
        ),
        child:Obx(() => Center(
          child: controller.isLoading.value
              ? LoadingSpinner()
              : Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppDimensions.buttonFontSize,
            ),
          ),
        ),)
      ),
    );
  }
}



//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../utils/AppStrings.dart';
// import '../../utils/constants/AppDimensions.dart';
// import '../loader/LoadingSpinner.dart';
//
// class CustomButton extends StatelessWidget {
//   final loginController;
//
//   CustomButton({required this.loginController});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         loginController.signInUser(
//           email: loginController.emailController.text,
//           password: loginController.passwordController.text,
//         );
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width - (2 * AppDimensions.screenPadding),
//         height: AppDimensions.buttonHeight,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius),
//         ),
//         child: Obx(
//               () => Center(
//             child: loginController.isLoading.value
//                 ? LoadingSpinner()
//                 : Text(
//               AppStrings.sign_in,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: AppDimensions.buttonFontSize,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
