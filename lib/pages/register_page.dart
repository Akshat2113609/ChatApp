import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';
import 'package:myapp/components/my_buttons.dart';
import 'package:myapp/components/my_textfile.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  Future<void> register(BuildContext context) async {
    final _auth = AuthService();
    if (_passwordController.text == _confirmpasswordController.text) {
      try {
        await _auth.signUpWithEmailandPassword(
          _emailController.text,
          _passwordController.text,
        );
        // Navigate to home or success page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration successful!")),
        );
        // Or Navigate to another screen
        // Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          ),
        );
      }
    } else {
      // Show an error message if passwords don't match
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Error"),
          content: Text("Passwords do not match"),
        ),
      );
    }
  }

  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.message,
                size: 45,
                color: Colors.black,
              ),
              const SizedBox(height: 25),
              const Text(
                "LET'S START YOUR JOURNEY",
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
              MyTextfile(
                HintText: "Confirm Password",
                obscuretext: true,
                controller: _confirmpasswordController,
              ),
              const SizedBox(height: 25),
              MyButton(onTap: () => register(context), text: "Register"),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Login Now",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
