import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/mobile/RegisterScreenMobileView.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/LoginScreeMobileView.dart';






class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: LoginScreenMobileView(
      ),
      tablet: LoginScreenMobileView(
      ),
      desktop: LoginScreenMobileView(),
    );
  }

}