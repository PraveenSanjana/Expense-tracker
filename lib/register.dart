import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'signin.dart'; // Import your sign-in page

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/landing.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.88,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Top-left corner radius
                  topRight: Radius.circular(30.0), // Top-right corner radius
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28), // Add spacing above the title
                  const Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 24, // You can adjust the font size as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10), // Add spacing below the title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextField("First Name", "Enter your first name"),
                        buildTextField("Last Name", "Enter your last name"),
                        buildTextField("Email", "Enter your email"),
                        buildTextField("Mobile", "Enter your mobile"),
                        buildTextField("Password", "Enter your password"),
                        buildTextField("Password", "Repeat your password"),
                        const SizedBox(height: 15,), // Add spacing before the "Register" button
                        Center(
                          child: SizedBox(
                            width: 370,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                // Implement your "Register" functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, 
                                backgroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0), // Border radius
                                ),
                              ),
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), // Add spacing below the "Register" button
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black, // You can customize the color
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign In",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue, // Customize the color for "Sign In"
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to the sign-in page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignInPage()),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4), // Add left padding
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 3),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true,
            fillColor: Colors.transparent, // Transparent background
            contentPadding: const EdgeInsets.all(15.0),
          ),
          style: const TextStyle(fontSize: 16.0),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20), // Add spacing between fields
      ],
    );
  }
}
