import 'package:flutter/material.dart';
import 'package:myapp/themes/light_mode.dart';
import 'package:myapp/pages/login_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      home: LoginPage(),
      theme: lightMode,
    );
  }
}
