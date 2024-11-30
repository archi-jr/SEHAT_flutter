// import 'package:flutter/material.dart';

// class CreateTicketPage extends StatefulWidget {
//   const CreateTicketPage({Key? key}) : super(key: key);
//
//   @override
//   _CreateTicketPageState createState() => _CreateTicketPageState();
// }
//
// class _CreateTicketPageState extends State<CreateTicketPage> {
//   final List<String> _timeSlots = _generateTimeSlots();
//   final List<String> _doctors = [
//     'Dr. John Smith, City Clinic, Cardiology',
//     'Dr. Sarah Johnson, HealthCare Clinic, Neurology',
//     'Dr. Emily Davis, Metro Clinic, Orthopedics',
//     'Dr. Robert Brown, Central Clinic, Dermatology',
//     'Dr. Lisa White, Harmony Clinic, Pediatrics',
//   ];
//
//   String? _selectedTimeSlot;
//   String? _selectedDoctor;
//
//   static List<String> _generateTimeSlots() {
//     List<String> timeSlots = [];
//     int startHour = 9;
//     int endHour = 20; // 8 PM
//
//     for (int hour = startHour; hour <= endHour; hour++) {
//       String formattedHour =
//           hour > 12 ? (hour - 12).toString() : hour.toString();
//       String suffix = hour >= 12 ? 'PM' : 'AM';
//       timeSlots.add('$formattedHour:00 $suffix');
//       timeSlots.add('$formattedHour:30 $suffix');
//     }
//     return timeSlots;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, color: Colors.black),
//             onPressed: () {
//               // Action for settings
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Create Ticket',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 7),
//               Divider(thickness: 2, color: Colors.black),
//               SizedBox(height: 16),
//
//               // Label for symptoms
//               Text(
//                 'Your symptoms',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 8),
//
//               // Text field for entering symptoms
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter your symptoms',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Suggested Doctor section
//               Text(
//                 'Suggested Doctor',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 8),
//               Container(
//                 padding: EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade700,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Text(
//                   'Dr. John Smith, City Clinic, Cardiology',
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Choose Doctor section
//               Text(
//                 'Choose Doctor:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 8),
//
//               // Dropdown for choosing doctor
//               DropdownButtonFormField<String>(
//                 value: _selectedDoctor,
//                 hint: Text('Select a doctor'),
//                 items: _doctors.map((String doctor) {
//                   return DropdownMenuItem<String>(
//                     value: doctor,
//                     child: Text(doctor),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedDoctor = newValue;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Label for time slot selection
//               Text(
//                 'Choose Your Time Slot',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 8),
//
//               // Dropdown for selecting time slot
//               DropdownButtonFormField<String>(
//                 value: _selectedTimeSlot,
//                 hint: Text('Select a time slot'),
//                 items: _timeSlots.map((String timeSlot) {
//                   return DropdownMenuItem<String>(
//                     value: timeSlot,
//                     child: Text(timeSlot),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedTimeSlot = newValue;
//                   });
//                 },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 36),
//
//               // Continue button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ScanQRCodePage()),
//                     );
//                   },
//                   child: Text(
//                     'Continue',
//                     style: TextStyle(
//                       color: Colors.black, // Set the text color to black
//                       fontWeight: FontWeight.bold, // Make the text bold
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.green.shade700, // Button color
//                     padding:
//                         EdgeInsets.symmetric(vertical: 15, horizontal: 100),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //QR CODE for the Create Ticket
// class ScanQRCodePage extends StatelessWidget {
//   const ScanQRCodePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your QR Code'),
//         backgroundColor: Colors.white,
//         elevation: 10,
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
//                 'assests/images/images4.png', // Add your biometric image asset here
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 100),
//             Divider(
//               thickness: 2,
//               color: Colors.black,
//             ),
//
//             // Instruction Text
//             Text(
//               'Scan QR Code',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             // SizedBox(height: 40),
//             // // Login Button
//             // ElevatedButton(
//             //   onPressed: () {
//             //     // After biometric scan, navigate to Profession Selection Page
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //           builder: (context) => ProfessionSelectionPage()),
//             //     );
//             //   },
//             //   child: Text(
//             //     'Login',
//             //     style: TextStyle(color: Colors.white),
//             //   ),
//             //   style: ElevatedButton.styleFrom(
//             //     primary: Colors.blue,
//             //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
//             //     shape: RoundedRectangleBorder(
//             //       borderRadius: BorderRadius.circular(20),
//             //     ),
//             //   ),
//             // ),
//             // SizedBox(height: 20),
//             // // Login with Aadhaar Card
//             // // TextButton(
//             // //   onPressed: () {
//             // //     // Redirect to Initial Sign In Page
//             // //     Navigator.pushAndRemoveUntil(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => LoginPage()),
//             //       (route) => false, // Remove all routes
//             //     );
//             //   },
//             //   child: Text(
//             //     'Login in with Aadhaar Card',
//             //     style: TextStyle(
//             //       fontSize: 16,
//             //       color: Colors.blue,
//             //       decoration: TextDecoration.underline,
//             //     ),
//             //   ),
//             // ),
//             // SizedBox(height: 20),
//             // No account? Sign In Text
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             // Text(
//             //   'No account? ',
//             //   style: TextStyle(fontSize: 16),
//             // ),
//             // GestureDetector(
//             //   onTap: () {
//             //     // Redirect to Initial Sign In Page
//             //     Navigator.pushAndRemoveUntil(
//             //       context,
//             //       MaterialPageRoute(builder: (context) => LoginPage()),
//             //       (route) => false, // Remove all routes
//             //     );
//             //   },
//             //   child: Text(
//             //     'Sign in',
//             //     style: TextStyle(
//             //       fontSize: 16,
//             //       color: Colors.red,
//             //       decoration: TextDecoration.underline,
//             //     ),
//             //   ),
//             // ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class CreateTicketPage extends StatefulWidget {
  const CreateTicketPage({Key? key}) : super(key: key);

  @override
  _CreateTicketPageState createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  final List<String> _timeSlots = _generateTimeSlots();
  final List<String> _doctors = [
    'Dr. John Smith, City Clinic, Cardiology',
    'Dr. Sarah Johnson, HealthCare Clinic, Neurology',
    'Dr. Emily Davis, Metro Clinic, Orthopedics',
    'Dr. Robert Brown, Central Clinic, Dermatology',
    'Dr. Lisa White, Harmony Clinic, Pediatrics',
  ];

  String? _selectedTimeSlot;
  String? _selectedDoctor;
  String? _symptoms;

  static List<String> _generateTimeSlots() {
    List<String> timeSlots = [];
    int startHour = 9;
    int endHour = 20; // 8 PM

    for (int hour = startHour; hour <= endHour; hour++) {
      String formattedHour =
          hour > 12 ? (hour - 12).toString() : hour.toString();
      String suffix = hour >= 12 ? 'PM' : 'AM';
      timeSlots.add('$formattedHour:00 $suffix');
      timeSlots.add('$formattedHour:30 $suffix');
    }
    return timeSlots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Action for settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Ticket',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Divider(thickness: 2, color: Colors.black),
              SizedBox(height: 16),

              // Label for symptoms
              Text(
                'Your symptoms',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),

              // Text field for entering symptoms
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your symptoms',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _symptoms = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Suggested Doctor section
              Text(
                'Suggested Doctor',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Dr. John Smith, City Clinic, Cardiology',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              SizedBox(height: 16),

              // Choose Doctor section
              Text(
                'Choose Doctor:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),

              // Dropdown for choosing doctor
              DropdownButtonFormField<String>(
                value: _selectedDoctor,
                hint: Text('Select a doctor'),
                items: _doctors.map((String doctor) {
                  return DropdownMenuItem<String>(
                    value: doctor,
                    child: Text(doctor),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDoctor = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Label for time slot selection
              Text(
                'Choose Your Time Slot',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),

              // Dropdown for selecting time slot
              DropdownButtonFormField<String>(
                value: _selectedTimeSlot,
                hint: Text('Select a time slot'),
                items: _timeSlots.map((String timeSlot) {
                  return DropdownMenuItem<String>(
                    value: timeSlot,
                    child: Text(timeSlot),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTimeSlot = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 36),

              // Continue button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedTimeSlot != null &&
                        _selectedDoctor != null &&
                        _symptoms != null &&
                        _symptoms!.isNotEmpty) {
                      String userDetails = '''
                      Symptoms: $_symptoms
                      Doctor: $_selectedDoctor
                      Time Slot: $_selectedTimeSlot
                      ''';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScanQRCodePage(userDetails),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade700, // Button color
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScanQRCodePage extends StatelessWidget {
  final String userDetails;

  const ScanQRCodePage(this.userDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your QR Code'),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrettyQrView.data(data: userDetails!),
            //Display QR Code
            // QrImage(
            //   data: userDetails,
            //   version: QrVersions.auto,
            //   size: 200.0,
            // ),
            SizedBox(height: 100),
            Divider(thickness: 2, color: Colors.black),
            Text(
              'Your QR Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
