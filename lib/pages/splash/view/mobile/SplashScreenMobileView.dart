

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harvery_solutions_task/utils/AppUtils.dart';

import '../../../services_listing/view/page/ServicesListScreen.dart';



/*-------------------------------------------------------------------------------------------------------*/
//This screen is created to show splash screen to the user.
/*-------------------------------------------------------------------------------------------------------*/
class SplashScreenMobileView extends StatelessWidget {
  const SplashScreenMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppUtils.navigateFromSplashScreen();
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
