import 'package:flutter/material.dart';
import 'package:myapp/Auth/auth_service.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  void logOut() {
    final auth = AuthService();
    auth.signOut();
  }
  @override
  Widget build(context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Colors.black,
                    size: 45,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    }),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
            child: ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap:logOut,
            ),
          ),
        ],
      ),
    );
  }
}
