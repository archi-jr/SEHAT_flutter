// import 'package:first_app/Pages/Professional.dart';
// import 'package:flutter/material.dart';
//
// import '../../main.dart';
//
// class BiometricPage extends StatelessWidget {
//   const BiometricPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Biometric Login'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Biometric Icon
//             Container(
//               height: 150,
//               width: 150,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black12),
//               ),
//               child: Image.asset(
//                 'assests/images/Img3.jpg', // Add your biometric image asset here
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 20),
//             // Instruction Text
//             Text(
//               'Place Your Finger over the Sensor',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 40),
//             // Login Button
//             ElevatedButton(
//               onPressed: () {
//                 // After biometric scan, navigate to Profession Selection Page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ProfessionSelectionPage()),
//                 );
//               },
//               child: Text(
//                 'Login',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Login with Aadhaar Card
//             TextButton(
//               onPressed: () {
//                 // Redirect to Initial Sign In Page
//                 Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                   (route) => false, // Remove all routes
//                 );
//               },
//               child: Text(
//                 'Login in with Aadhaar Card',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.blue,
//                   decoration: TextDecoration.underline,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // No account? Sign In Text
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'No account? ',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Redirect to Initial Sign In Page
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginPage()),
//                       (route) => false, // Remove all routes
//                     );
//                   },
//                   child: Text(
//                     'Sign in',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.red,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:first_app/Pages/Professional.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart'; // Import the local_auth package

import '1st_page.dart';

class BiometricPage extends StatefulWidget {
  const BiometricPage({Key? key}) : super(key: key);

  @override
  _BiometricPageState createState() => _BiometricPageState();
}

class _BiometricPageState extends State<BiometricPage> {
  late final LocalAuthentication auth =
      LocalAuthentication(); // Initialize LocalAuthentication

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      // Check if the device supports biometric authentication
      bool canCheckBiometrics = await auth.canCheckBiometrics;

      if (canCheckBiometrics) {
        // Attempt to authenticate the user using biometric authentication
        authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to login',
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
      }
    } catch (e) {
      // Handle authentication failure
      print(e);
    }

    if (authenticated) {
      // If authentication is successful, navigate to Profession Selection Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfessionSelectionPage()),
      );
    } else {
      // If authentication fails, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Login'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Biometric Icon
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              child: Image.asset(
                'assests/images/Img3.jpg', // Add your biometric image asset here
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Instruction Text
            Text(
              'Place Your Finger over the Sensor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            // Login Button
            ElevatedButton(
              onPressed: _authenticate, // Trigger biometric authentication
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Login with Aadhaar Card
            TextButton(
              onPressed: () {
                // Redirect to Initial Sign In Page
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Remove all routes
                );
              },
              child: Text(
                'Login in with Aadhaar Card',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 20),
            // No account? Sign In Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No account? ',
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    // Redirect to Initial Sign In Page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false, // Remove all routes
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
