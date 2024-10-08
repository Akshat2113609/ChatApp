import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';
import 'package:myapp/components/my_buttons.dart';
import 'package:myapp/components/my_textfile.dart';

class LoginPage extends StatelessWidget {
  // email and password text controller
  //Controllers allow you to respond to user events, such as typing text,
  //scrolling through a list, or triggering an animation.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap,
  });
  //implement login meathod
  void login(BuildContext context) async {
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailandPassword(
          _emailController.text, _passwordController.text);
    }
    //errors
    catch (e) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ));
    }
  }

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
          const SizedBox(height: 25),
          // button
          MyButton(onTap: () => login, text: "Login"),
          const SizedBox(height: 25),
          // registeration button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New Here ?"),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "Register Now",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
