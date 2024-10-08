import 'package:flutter/material.dart';
import 'package:myapp/components/my_buttons.dart';
import 'package:myapp/components/my_textfile.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  void register(){

  }
 final void Function()? onTap;
  RegisterPage({super.key,
  required this.onTap,
  });
  @override 
  Widget build(context){
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
            "LET'S START YOUR JOURNEY",
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

          const SizedBox(height:25),
           MyTextfile(
            HintText: "Confirm Password",
            obscuretext: true,
            controller: _confirmpasswordController,
          ),
          const SizedBox(height:25),
          // button
          MyButton(
            onTap:register,
            text:"Register"
          ),
            const SizedBox(height:25),
            // registeration button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?"),
                GestureDetector(
                  onTap:onTap,
                  child: Text("Login Now",style: TextStyle(
                    color:Colors.blue,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )
        ]),
      ),
    );
  }
}
