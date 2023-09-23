import 'package:flutter/cupertino.dart';


import '../../../../../utils/responsive/ResponsiveView.dart';
import '../mobile/ServicesListScreenMobileView.dart';





class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: ServicesListScreenMobileView(
      ),
      tablet: ServicesListScreenMobileView(
      ),
      desktop: ServicesListScreenMobileView(),
    );
  }

}