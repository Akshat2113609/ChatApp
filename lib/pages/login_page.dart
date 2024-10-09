import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';
import 'package:myapp/components/my_buttons.dart';
import 'package:myapp/components/my_textfile.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailandPassword(
        _emailController.text,
        _passwordController.text,
      );
       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                size: 45,
                color: Colors.black,
              ),
              const SizedBox(height: 25),
              const Text(
                "HEY THERE, WE MISSED YOU",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 25),
              MyTextfile(
                HintText: "Email",
                obscuretext: false,
                controller: _emailController,
              ),
              const SizedBox(height: 25),
              MyTextfile(
                HintText: "Password",
                obscuretext: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 25),
              MyButton(onTap: login, text: "Login"),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("New Here?"),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}