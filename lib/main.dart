import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/services/Auth/auth_gate.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/themes/light_mode.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),child:Myapp()) );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
