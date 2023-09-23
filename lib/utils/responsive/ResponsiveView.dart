import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';



/*-------------------------------------------------------------------------------------------------------*/
//This file is created to check whether our app is running on mobile , tablet or desktop.
/*-------------------------------------------------------------------------------------------------------*/
class ResponsiveView extends StatelessWidget {
  const ResponsiveView({
    Key? key,
    this.mobile,
    this.desktop,
    this.tablet,
  }) : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  static bool get isMobileDevice => Get.width >= 300 && Get.width < 600;
  static bool get isTabletDevice => Get.width >= 600 && Get.width < 1000;
  static bool get isDesktopDevice => Get.width >= 1000;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: const ScreenBreakpoints(
        tablet: 600,
        desktop: 1000,
        watch: 300,
      ),
      mobile: (BuildContext context) => mobile!,
      tablet: (BuildContext context) => tablet!,
      desktop: (BuildContext context) => desktop!,
    );
  }
}
