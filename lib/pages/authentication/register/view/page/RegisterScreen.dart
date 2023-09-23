import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/mobile/RegisterScreenMobileView.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';






class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: RegisterScreenMobileView(
      ),
      tablet: RegisterScreenMobileView(
      ),
      desktop: RegisterScreenMobileView(),
    );
  }

}