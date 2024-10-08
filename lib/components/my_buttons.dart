import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  MyButton({super.key,
  required this.text,
  required this.onTap
  });
  @override
  Widget build(context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child:Center(child: Text(text,
        style: TextStyle(
          fontSize: 18,
        ),),
        ),
      ),
    );
  }
}
