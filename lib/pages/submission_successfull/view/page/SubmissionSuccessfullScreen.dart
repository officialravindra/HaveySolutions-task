import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/register/view/mobile/RegisterScreenMobileView.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/SubmissionSuccessfullScreenMobileView.dart';







class SubmissionSuccessfullScreen extends StatelessWidget {
  const SubmissionSuccessfullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: SubmissionSuccessfullScreenMobileView(
      ),
      tablet: SubmissionSuccessfullScreenMobileView(
      ),
      desktop: SubmissionSuccessfullScreenMobileView(),
    );
  }

}