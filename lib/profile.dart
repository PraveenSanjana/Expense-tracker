
import 'package:expense_tracker/changepassword.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'calendar.dart';
import 'chart.dart';
import 'input.dart';
import 'signin.dart';

class ProfilePage extends StatefulWidget {
  final String userName; // Pass the user's name as a parameter
  ProfilePage({required this.userName});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile; // Initialize with null

  Future _getImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                GestureDetector(onTap: () {
                // Display options to choose a photo from camera or gallery
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.camera),
                            title: Text('Take a Photo'),
                            onTap: () {
                              Navigator.pop(context);
                              _getImageFromCamera();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.photo),
                            title: Text('Choose from Gallery'),
                            onTap: () {
                              Navigator.pop(context);
                              _getImageFromGallery();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
                  child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.grey[600],
                      )
                    : null,
              ),
                ),
                 const SizedBox(height: 20), // Add spacing above the title
                  const Text(
                    "John",
                    style: TextStyle(
                      fontSize: 30, // You can adjust the font size as needed
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 59, 57, 57),
                    ),
                  ),
                  
                
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle edit profile button click
                  },
                  style: ElevatedButton.styleFrom(
                
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color(0xFF2A9886),
                ),
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Create the list of items with icons and text
          _buildProfileItem(Icons.email, 'Email: user@example.com'),
          _buildProfileItem(Icons.phone, 'Mobile: +1234567890'),
          _buildProfileItem(Icons.brightness_4, 'Dark Mode', hasSwitch: true),
          _buildProfileItem(Icons.lock, 'Change Password'),
          _buildProfileItem(Icons.info, 'About'),
          _buildProfileItem(Icons.exit_to_app, 'Logout'),
        ],
      ),
      bottomNavigationBar: ClipRRect(
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(40), // Add top border curve
  ),
  child: BottomAppBar(
    color: Color.fromARGB(255, 224, 224, 224), // Background color of the navigation bar
    child: SizedBox(
      height: 80, // Adjust the height as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0), // Add left padding to Home icon
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 35, // Increase the icon size
              ),
              onPressed: () {
                // Navigate to HomePage.dart when Home icon is clicked
                //Navigator.push(
                 // context,
                  //MaterialPageRoute(builder: (context) => HomePage()),
                //);
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.show_chart,
              size: 37, // Increase the icon size
            ),
            onPressed: () {
              // Handle Graphs button press or navigate to a Graphs page
              // You can replace the following code with navigation logic to a Graphs page
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChartPage()),
                    );
            },
          ),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2A9886), // Background color of the circle
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0), // Add padding to the Plus icon
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 32, // Increase the icon size
                    color: const Color.fromARGB(255, 255, 255, 255), // Plus mark color
                  ),
                  onPressed: () {
                    // Navigate to IncomeExpense.dart when Plus icon is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IncomeExpensePage()),
                    );
                  },
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_today,
              size: 32, // Increase the icon size
            ),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()),
                    );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Add right padding to Profile icon
            child: IconButton(
              icon: Icon(
                Icons.person,
                size: 32, // Increase the icon size
              ),
              onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage(userName: '',)),
                    );
              },
          ),
          )
        ],
      ),
    ),
  ),
),

    );
  }

  Widget _buildProfileItem(IconData icon, String text, {bool hasSwitch = false}) {
    return GestureDetector(
    onTap: () {
      if (text == 'Change Password') {
        // Navigate to the ChangePassword screen when "Change Password" is tapped
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangePasswordPage()));
      }
      // Add logic for other items if needed
    
      if (text == 'About') {
        // Show the About dialog when "About" is tapped
        _showAboutDialog(context);
      }
      // Add logic for other items if needed
      if (text == 'Logout') {
        // Show the logout confirmation dialog when "Logout" is tapped
         _showDialog(context);
      }
    },
    child: Container(
      width: 308,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: <Widget>[
                Icon(icon),
                SizedBox(width: 16),
                Text(text),
              ],
            ),
          ),
          if (hasSwitch)
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Switch(
                // Handle dark mode switch logic here
                value: false, // Replace with your logic for dark mode
                onChanged: (value) {
                  // Handle switch change
                },
              ),
            ),
        ],
      ),
    )
    );
  }
  void _showAboutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0), // Add border radius
        ),
        contentPadding: EdgeInsets.all(16.0), // Adjust content padding
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Increase the gap between text and button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Dismiss'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
            ),
            ),
          ],
        ),
      );
    },
  );
}
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Are you sure",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "you want to logout?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
                    child: Text('Cancel'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8), // Add horizontal padding
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle logout button click here
                      Navigator.of(context).pop(); // Dismiss the dialog
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => SignInPage()));
                    },
                    child: Text('Logout'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}



}
