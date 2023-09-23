import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  /*-------------------------------------------------------------------------------------------------------*/
  //This function is used to login user from firebase.
  /*-------------------------------------------------------------------------------------------------------*/

  Future<dynamic> signInUser({required String? email, required String? password}) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final User? user = userCredential.user;

      if (user != null) {
        return user; // Return the user object
      } else {
        return "User is null"; // Return a string indicating user is null
      }
    } catch (err) {
      return err.toString(); // Return an error message if there's an exception
    }
  }
}
