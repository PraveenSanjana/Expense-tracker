// edit_profile.dart

import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String initialEmail;
  final String initialPhoneNumber;

  EditProfilePage({
    required this.initialEmail,
    required this.initialPhoneNumber,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.initialEmail);
    _phoneNumberController = TextEditingController(text: widget.initialPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save the edited data and navigate back to ProfilePage
                Navigator.pop(context, {
                  'editedEmail': _emailController.text,
                  'editedPhoneNumber': _phoneNumberController.text,
                });
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
