import 'package:flutter/material.dart';
import 'package:myapp/components/my_textfile.dart';

class LoginPage extends StatelessWidget {
  // email and password text controller
  //Controllers allow you to respond to user events, such as typing text, 
  //scrolling through a list, or triggering an animation.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //logo
          Icon(
            Icons.message,
            size: 45,
            color: Colors.black,
          ),
          const SizedBox(height: 25),
          // A welcome message
          Text(
            "HEY THERE, WE MISSED YOU ",
            style: TextStyle(
              fontSize: 15,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 25),
          // email input space
          MyTextfile(
            HintText: "Email",
            obscuretext: false,
            controller: _emailController,
          ),
          const SizedBox(height: 25),
          // password input space
          MyTextfile(
            HintText: "Password",
            obscuretext: true,
            controller: _passwordController,
          ),
        ]),
      ),
    );
  }
}
