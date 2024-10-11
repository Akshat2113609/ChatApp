import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? getcurrentUser() {
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredintial = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _firestore.collection("Users").doc(userCredintial.user!.uid).set({
        "uid": userCredintial.user!.uid,
        "email": email,
      });
      return userCredintial;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //sign up

  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredintial = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // save data seperately
      _firestore.collection("Users").doc(userCredintial.user!.uid).set({
        "uid": userCredintial.user!.uid,
        "email": email,
      });
      return userCredintial;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}
