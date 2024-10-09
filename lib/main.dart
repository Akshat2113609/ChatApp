import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_gate.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      home: AuthGate(),
      theme: lightMode,
    );
  }
}
