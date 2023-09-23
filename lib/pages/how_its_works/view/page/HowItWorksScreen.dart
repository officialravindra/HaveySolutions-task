import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/mobile/RegisterScreenMobileView.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/HowItWorksScreenMobileView.dart';







class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: HowItWorksScreenMobileView(
      ),
      tablet: HowItWorksScreenMobileView(
      ),
      desktop: HowItWorksScreenMobileView(),
    );
  }

}