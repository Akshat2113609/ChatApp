import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredintial = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredintial;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //sign up

  //errors
}
