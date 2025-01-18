import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Name'),
              subtitle: const Text('John Doe'), // Replace with actual user name
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to name edit screen or show modal dialog
              },
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: const Text('johndoe@example.com'), // Replace with actual user email
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to email edit screen or show modal dialog
              },
            ),
            ListTile(
              title: const Text('Password'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to password change screen or show modal dialog
              },
            ),
            ListTile(
              title: const Text('Change Profile Image'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to profile image change screen or show modal dialog
              },
            ),
            ListTile(
              title: const Text('Change Location'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Navigate to location change screen or show modal dialog
              },
            ),
          ],
        ),
      ),
    );
  }
}

