// actions: [
//   IconButton(
//     onPressed: () {
//       Navigator.popAndPushNamed(context, "/scan");
//     },
//     icon: const Icon(
//       Icons.qr_code_scanner,
//     ),
//   ),
// ],
//),

// body: Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       // Biometric Icon
//       Container(
//         height: 150,
//         width: 150,
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.black12),
//         ),
//         child: Image.asset(
//           'assests/images/images4.png', // Add your biometric image asset here
//           fit: BoxFit.cover,
//         ),
//       ),
//       SizedBox(height: 100),
//       Divider(
//         thickness: 2,
//         color: Colors.black,
//       ),
//
//       // Instruction Text
//       Text(
//         'Your QR Code',
//         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         textAlign: TextAlign.center,
//       ),
//       // SizedBox(height: 40),
//       // // Login Button
//       // ElevatedButton(
//       //   onPressed: () {
//       //     // After biometric scan, navigate to Profession Selection Page
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(
//       //           builder: (context) => ProfessionSelectionPage()),
//       //     );
//       //   },
//       //   child: Text(
//       //     'Login',
//       //     style: TextStyle(color: Colors.white),
//       //   ),
//       //   style: ElevatedButton.styleFrom(
//       //     primary: Colors.blue,
//       //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
//       //     shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(20),
//       //     ),
//       //   ),
//       // ),
//       // SizedBox(height: 20),
//       // // Login with Aadhaar Card
//       // // TextButton(
//       // //   onPressed: () {
//       // //     // Redirect to Initial Sign In Page
//       // //     Navigator.pushAndRemoveUntil(
//       //       context,
//       //       MaterialPageRoute(builder: (context) => LoginPage()),
//       //       (route) => false, // Remove all routes
//       //     );
//       //   },
//       //   child: Text(
//       //     'Login in with Aadhaar Card',
//       //     style: TextStyle(
//       //       fontSize: 16,
//       //       color: Colors.blue,
//       //       decoration: TextDecoration.underline,
//       //     ),
//       //   ),
//       // ),
//       // SizedBox(height: 20),
//       // No account? Sign In Text
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       // Text(
//       //   'No account? ',
//       //   style: TextStyle(fontSize: 16),
//       // ),
//       // GestureDetector(
//       //   onTap: () {
//       //     // Redirect to Initial Sign In Page
//       //     Navigator.pushAndRemoveUntil(
//       //       context,
//       //       MaterialPageRoute(builder: (context) => LoginPage()),
//       //       (route) => false, // Remove all routes
//       //     );
//       //   },
//       //   child: Text(
//       //     'Sign in',
//       //     style: TextStyle(
//       //       fontSize: 16,
//       //       color: Colors.red,
//       //       decoration: TextDecoration.underline,
//       //     ),
//       //   ),
//       // ),
//       //   ],
//       // ),
//     ],
//   ),
// ),
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ScanQRCodePage_doc extends StatefulWidget {
  //const ScanQRCodePage_doc({Key? key}) : super(key: key);
  const ScanQRCodePage_doc({super.key});
  @override
  State<ScanQRCodePage_doc> createState() => _ScanQRCodePage_doc();
}

class _ScanQRCodePage_doc extends State<ScanQRCodePage_doc> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Generate'),
          backgroundColor: Colors.purple.shade300,
          elevation: 10,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Write Prescription', // Placeholder text
                  border:
                      OutlineInputBorder(), // Optional: add border to the text field
                ),
              ),
              if (qrData != null) PrettyQrView.data(data: qrData!),
            ],
          ),
        ));
  }
}
