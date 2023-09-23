import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/utils/AppStrings.dart';

import '../../../../utils/AppUtils.dart';
import '../model/UserModel.dart';



/*-------------------------------------------------------------------------------------------------------*/
//This function will register the user to firebase.
/*-------------------------------------------------------------------------------------------------------*/
class RegisterRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String result = AppStrings.error;

    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userModel = UserModel(
        email: email,
        name: name,
        uid: userCredential.user!.uid,
      );

      await _firestore
          .collection(AppStrings.firebase_collection_name)
          .doc(userCredential.user!.uid)
          .set(
            userModel.toJson(),
          );

      AppUtils.showSnackbar(
        AppUtils().getContext(),
        AppStrings.register_success,
        AppStrings.success,
      );

      result = AppStrings.success;
    } catch (err) {
      result = err.toString();
      if (result.contains(AppStrings.mail_already_in_use)) {
        AppUtils.showSnackbar(
            Get.context!, AppStrings.mail_already_in_use, AppStrings.oops);
      } else {
        AppUtils.showSnackbar(Get.context!, result, AppStrings.oops);
      }
    }

    return result;
  }
}
