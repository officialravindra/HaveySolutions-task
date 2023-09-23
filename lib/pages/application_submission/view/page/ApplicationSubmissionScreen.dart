import 'package:flutter/cupertino.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/ApplicationSubmissionScreenMobileView.dart';






class ApplicationSubmissionScreen extends StatelessWidget {
  const ApplicationSubmissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: ApplicationSubmissionScreenMobileView(
      ),
      tablet: ApplicationSubmissionScreenMobileView(
      ),
      desktop: ApplicationSubmissionScreenMobileView(),
    );
  }

}