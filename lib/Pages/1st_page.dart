import 'package:first_app/Pages/sos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'biometric.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  // Function to open the URL in an external browser
  // Future<void> _launchURL() async {
  //   const url = "https://sih-final-chi.vercel.app/";
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.shield_moon, color: Colors.black),
          onPressed: () {
            Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            );
          },
        ),

        // Add button to open the website
        actions: [
          IconButton(
            icon: Icon(Icons.web, color: Colors.black),
            onPressed: () {
              // Show the popup dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Visit our Website"),
                    content: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade700,
                        // Green button
                      ),
                      //onPressed: _launchURL, // Launch the website
                      onPressed: () {
                        const link = "https://sih-final-chi.vercel.app/";
                        launchUrl(Uri.parse(link),
                            mode: LaunchMode.externalApplication);
                      },
                      child: const Text(
                        'Click Here',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Placeholder for the logo at the top
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.7),
                      Colors.orangeAccent.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0),
                    child: Image.asset(
                      "assests/images/Img1.jpg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Aadhaar Number Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Aadhaar Number',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // OTP Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              // Sign In Button
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BiometricPage()),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black, // Change text color to black
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Button color
                ),
              ),
              const SizedBox(height: 10),
              // SOS button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SOS()),
                  );
                },
                child: const Text(
                  'SOS Button',
                  style: TextStyle(
                    color: Colors.black, // Change text color to black
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Button color
                ),
              ),
              const SizedBox(height: 10),
              // Biometric Sign In
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BiometricPage()),
                  );
                },
                child: const Text(
                  'Sign in with Biometric',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Already Registered? Log In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already Registered?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BiometricPage()),
                      );
                    },
                    child: const Text(
                      ' Log in',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
