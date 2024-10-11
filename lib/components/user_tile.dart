import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()?onTap;
  const UserTile({
  super.key,
  required this.text,
  required this.onTap,
  });
  @override
  Widget build(context){
    return GestureDetector(
      onTap:onTap,
      child: Container(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3635258597.
        decoration:BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        padding: EdgeInsets.all(20),
child: Row(
  children:[
    const Icon(Icons.person_2),
    const SizedBox(width: 10),
    Text(text),
  ],
),
      ),
    );
  }
}
