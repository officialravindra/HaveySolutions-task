import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/routes/AppRoutes.dart';
import 'package:harvery_solutions_task/utils/base/ConnectivityController.dart';

/*-------------------------------------------------------------------------------------------------------*/
// App will start from here.
/*-------------------------------------------------------------------------------------------------------*/
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(ConnectivityController()); // Register ConnectivityController
      }),
      initialRoute: '/',
      routes: Routes.routes, // Use the routes from AppRoutes

    );



  }
}

