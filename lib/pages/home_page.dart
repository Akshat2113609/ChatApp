import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';
import 'package:myapp/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logOut() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(context) {
    MainAxisAlignment.center;
    return Scaffold(
      appBar: AppBar(title: const Text("home page"), actions: [
        IconButton(onPressed: logOut, icon: const Icon(Icons.logout)),
      ]
      ),
      drawer: MyDrawer(),
    );
  }
}
