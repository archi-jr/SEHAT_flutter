import 'package:flutter/material.dart';

import 'doctor_QR.dart';
import 'doctor_schedule.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.purple.shade300), // Back button

          onPressed: () => Navigator.of(context).pop(),
          // Navigate back or perform any action
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,
                color: Colors.purple.shade300), // Settings button
            onPressed: () {
              // Perform action for settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Text
            Text(
              'Welcome,\nDoctor Mithu ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 100),
            // Space after the title

            // Two buttons layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // My Schedule Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MySchedulePage()),
                    );
                  },
                  child: Text(
                    'My Schedule',
                    style: TextStyle(
                      color:
                          Colors.purple.shade300, // Set the text color to black
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                ),

                // Scan QR Code Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScanQRCodePage_doc()),
                    );
                  },
                  child: Text(
                    'QR Generate',
                    style: TextStyle(
                      color:
                          Colors.purple.shade300, // Set the text color to black
                      fontWeight: FontWeight.bold, // Make the text bold
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
