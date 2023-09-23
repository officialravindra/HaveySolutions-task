
/*-------------------------------------------------------------------------------------------------------*/
//This class is used to list all the routes used in app.
/*-------------------------------------------------------------------------------------------------------*/


import 'package:flutter/cupertino.dart';
import 'package:harvery_solutions_task/pages/authentication/login/view/page/LoginScreen.dart';
import 'package:harvery_solutions_task/pages/how_its_works/view/page/HowItWorksScreen.dart';

import '../pages/application_submission/view/page/ApplicationSubmissionScreen.dart';
import '../pages/authentication/register/view/page/RegisterScreen.dart';
import '../pages/services_listing/view/page/ServicesListScreen.dart';
import '../pages/splash/view/page/SplashScreen.dart';
import '../pages/submission_successfull/view/page/SubmissionSuccessfullScreen.dart';

class AppRoutes{

  static String splash_screen = "/";
  static String service_list_screen = "/service_list";
  static String login_screen = "/login";
  static String register_screen = "/register";
  static String application_submission_screen = "/application_submission";
  static String how_its_works_screen = "/how_its_works";
  static String submission_success_screen = "/submission_successfull";


}
class Routes {

  static Map<String, WidgetBuilder> routes = {
    '/': (context) => SplashScreen(),
    '/login': (context) => LoginScreen(),
    '/register': (context) => RegisterScreen(),
    '/how_its_works': (context) => HowItWorksScreen(),
    '/service_list': (context) => ServicesListScreen(),
    '/application_submission': (context) => ApplicationSubmissionScreen(),
    '/submission_successfull': (context) => SubmissionSuccessfullScreen(),
  };
}

