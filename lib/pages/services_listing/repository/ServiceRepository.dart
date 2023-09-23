import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../utils/AppStrings.dart';

class ServiceRepository {
  final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;


  /*-------------------------------------------------------------------------------------------------------*/
  //This function will be used to update the selected service to the firebase.
  /*-------------------------------------------------------------------------------------------------------*/
  Future<void> updateServiceType(String userId, String serviceType) async {
    try {
      DocumentReference documentRef =
          firestoreInstance.collection("users").doc(userId);

      Map<String, dynamic> dataToUpdate = {
        AppStrings.service_type_key: serviceType,
      };

      await documentRef.update(dataToUpdate);
      // Update was successful
      print("Document updated successfully");
    } catch (e) {
      // An error occurred while updating
      print("Error updating document: $e");
      throw e; // Rethrow the exception to handle it in the controller
    }
  }
}
