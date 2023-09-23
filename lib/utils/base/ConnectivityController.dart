import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';


/*-------------------------------------------------------------------------------------------------------*/
//This file is created to check internet connection in app.
/*-------------------------------------------------------------------------------------------------------*/
class ConnectivityController extends GetxController {
  final RxBool isOnline = true.obs;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((result) {
      isOnline.value = result != ConnectivityResult.none;

      print(isOnline.value);
    });
  }
}
