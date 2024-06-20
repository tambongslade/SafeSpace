import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(String email, String password, String name) async {
    String Res = "Some error occured";
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestore.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': credential.user!.uid,
      });
      Res = "Success";
      return Res;
    } catch (e) {
      print(e.toString());
    }
    return Res;
  }

  Future<String> loginUser(
    String email,
    String password,
  ) async {
    String Res = "Some error occured";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Res = "Success";
      return Res;
    } catch (e) {
      print(e.toString());
      return Res;
    }
  }

  Future<String?> getDisplayName(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        return userDoc.get('name')
            as String?; // Assuming you store name as 'name'
      } else {
        return null; // Handle the case where the user document doesn't exist
      }
    } catch (e) {
      print('Error getting display name: ${e.toString()}');
      return null;
    }
  }
}
