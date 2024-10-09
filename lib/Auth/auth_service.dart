import 'package:firebase_auth/firebase_auth.dart';

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

Future<UserCredential>signUpWithEmailandPassword(String email, String password) async{
  try{
    UserCredential userCredintial = await _auth.createUserWithEmailAndPassword(
      email: email, password: password);
       return userCredintial;
  }
 
  
  on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }
}
  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
  //errors
}
