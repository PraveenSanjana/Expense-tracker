
import 'package:expense_tracker/home.dart';
import 'package:expense_tracker/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'register.dart'; // Import your sign-in page
import 'forgot.dart'; // Import your sign-in page

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              height: MediaQuery.of(context).size.height * 0.53,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Top-left corner radius
                  topRight: Radius.circular(30.0), // Top-right corner radius
                ),
              ),
              
              child: Column(
                children: [
                  const SizedBox(height: 20), // Add spacing above the title
                  const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 30, // You can adjust the font size as needed
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 59, 57, 57),
                    ),
                  ),

                  const SizedBox(height: 15), // Add spacing below the title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 3), // Add left padding
                          child: Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 59, 57, 57),
                              
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Colors.transparent, // Transparent background
                            contentPadding:const EdgeInsets.all(15.0),
                          ),
                          style: const TextStyle(fontSize: 16.0),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 20), // Add spacing between fields
                        const Padding(
                          padding: EdgeInsets.only(left: 3), // Add left padding
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 59, 57, 57),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        TextField(
                          obscureText: true, // Hide password characters
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Colors.transparent, // Transparent background
                            contentPadding: const EdgeInsets.all(15.0),
                          ),
                          style: const TextStyle(fontSize: 16.0),
                        ),

                        const SizedBox(height: 5), // Add spacing before "Forgot Password?"
                        Align(
                          alignment: Alignment.centerRight, // Align to the right
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2), // Add left padding
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ),
                    );
                  },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 24, 107, 175), // You can customize the color
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 35), // Add spacing below "Forgot Password?"
                        Center(
                          child: SizedBox(
                            width: 370,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                // Implement your "Sign In" functionality here
                                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0), // Border radius
                                ),
                              ),
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account? ",
                              style: const TextStyle(
                                fontSize: 16,
                                color:  Color.fromARGB(255, 59, 57, 57),// You can customize the color
                              ),
                              children: [
                                TextSpan(
                                  text: "Register",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 24, 107, 175), // Customize the color for "Register"
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to the register.dart page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const RegisterPage()), // Assuming RegisterPage is the name of your registration page
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
                  // Add other widgets for your login form or content below the button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
