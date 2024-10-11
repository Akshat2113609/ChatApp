import 'package:flutter/material.dart';
import 'package:myapp/pages/chat_page.dart';
import 'package:myapp/services/Auth/auth_service.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/services/Auth/chat/chat_service.dart';
import 'package:myapp/components/user_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logOut() {
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,  // Use theme background color
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Theme.of(context).colorScheme.primary,   // Use primary color from theme
        actions: [
          IconButton(
            onPressed: logOut,
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.onPrimary,  // Ensure icon color matches theme
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(context),
    );
  }

  // Updated user list method
  Widget _buildUserList(BuildContext context) {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error loading users");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              "No users found",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,  // Theme-aware text color
              ),
            ),
          );
        }
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // Updated user list item method
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getcurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
