import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _oldPasswordController,
              obscureText: true, // To hide the password
              decoration: InputDecoration(
                labelText: 'Old Password',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to change the password here
                String oldPassword = _oldPasswordController.text;
                String newPassword = _newPasswordController.text;
                // Implement password change logic, e.g., validate and update
                // You can use the 'shared_preferences' package to store the new password
                // Check for validation and update
                if (oldPassword.isNotEmpty && newPassword.isNotEmpty) {
                  // Implement password change logic here
                  // Example: Update the password in SharedPreferences
                  // You can use the same SharedPreferences approach as in the previous example.
                  // Ensure to validate the old password correctly.
                  // After changing the password, you can navigate back to the previous screen.
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in both fields.'),
                    ),
                  );
                }
              },
              child: Text('Change Password'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }
}
