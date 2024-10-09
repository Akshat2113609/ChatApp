import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logOut() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(context) {
    mainAxisAlignment:
    MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(title: const Text("home page"), actions: [
        IconButton(onPressed: logOut, icon: const Icon(Icons.logout)),
      ]),
    );
  }
}
