import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:harvery_solutions_task/utils/AppStrings.dart';
import 'package:harvery_solutions_task/utils/SharedPreferencesUtils.dart';

class ApplicationSubmissionRepository {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to fetch user details from firebase.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<Map<String, dynamic>?> fetchUserDetails() async {
    String user_id = await SharedPreferencesUtils.getUserId();

    try {
      DocumentSnapshot userSnapshot = await firestoreInstance
          .collection(AppStrings.firebase_collection_name)
          .doc(user_id)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to update the data to the firebase.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<void> updateUserData({
    required String userId,
    required String fieldToUpdate,
    required dynamic newValue,
  }) async {
    try {
      DocumentReference documentRef = firestoreInstance
          .collection(AppStrings.firebase_collection_name)
          .doc(userId);

      // Create a map with the key-value pair to update
      Map<String, dynamic> dataToUpdate = {
        fieldToUpdate: newValue,
      };

      await documentRef.update(dataToUpdate);

      // Update was successful
    } catch (e) {
      // An error occurred while updating
      print(e.toString());
      throw e;
    }
  }
}
