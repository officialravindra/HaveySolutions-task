import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/mobile/RegisterScreenMobileView.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/SplashScreenMobileView.dart';







class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: SplashScreenMobileView(
      ),
      tablet: SplashScreenMobileView(
      ),
      desktop: SplashScreenMobileView(),
    );
  }

}