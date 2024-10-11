import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,  // Transparent AppBar for minimal look
        foregroundColor: Colors.black,        // Black text for title
        elevation: 0,                         // Remove shadow for flat look
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface, // Background color based on theme
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Dark Mode",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            CupertinoSwitch(
              activeColor: Colors.black,  // Black switch for sleek look in dark mode
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value),
            ),
          ],
        ),
      ),
    );
  }
}
