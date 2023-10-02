import 'package:flutter/material.dart';
import 'signin.dart'; // Import your sign-in page


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF60A8A3), // Set your desired background color
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/landing.png',
              fit: BoxFit.cover,
            ),

            const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 238, 237, 237),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 73, 73, 73), // Shadow color
                      offset: Offset(1,2.5), // Shadow offset
                      blurRadius: 3, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),

             const Padding(
              padding: EdgeInsets.only(top: 0.0), // Add padding only to the top of the second text
              child: Text(
                'To My Budget',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 238, 237, 237),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 73, 73, 73), // Shadow color
                      offset: Offset(1,2.5), // Shadow offset
                      blurRadius: 3, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 16.0), // Add padding only to the top of the second text
            child: Text(
              'Spend Smart, Track Easy!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color:Color.fromARGB(255, 235, 235, 235),
                  shadows: [
                    Shadow(
                      color: Color(0xFF494949), // Shadow color
                      offset: Offset(0,1), // Shadow offset
                      blurRadius: 3, // Shadow blur radius
                    ),
                  ],
              ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 35.0), // Add padding to the top of the button
              child: SizedBox(
                height: 51,
                width: 236,
                child: MaterialButton(
                  onPressed: () {
                     // Navigate to the signin.dart page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                  color: const Color.fromARGB(255, 16, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Set the border radius
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color.fromARGB(255, 214, 214, 214),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),




          ],
        ),
      ),
    );
  }
}
