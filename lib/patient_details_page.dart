import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Pages/create_ticket.dart';
import 'Pages/current_medicine.dart';
import 'Pages/health_record.dart';

class PatientDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.settings, color: Colors.black),
          //   onPressed: () {
          //     // Settings action
          //   },
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GOOD AFTERNOON, \nARCHISMAN',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  _buildButton(
                    context,
                    'Health \nRecord',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HealthRecordPage()),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildButton(
                    context,
                    'Current \nMedicine',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CurrentMedicinePage()),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildButton(
                    context,
                    'Create \nTicket',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateTicketPage()),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildButton(
                    context,
                    'Pharmacy \nNear Me',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Location()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.green.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//Pharmacies near me
//https://www.google.com/maps/search/?api=1&query=pharmacy+near+me
class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Details',
          style: TextStyle(
            color: Colors.black, // Set the text color to black
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          //onPressed: _launchGoogleMaps, // Launch Google Maps on click
          onPressed: () {
            const link =
                "https://www.google.com/maps/search/?api=1&query=pharmacy+near+me";

            launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
          },
          child: Text(
            'Pharmacy near Me',
            style: TextStyle(
              color: Colors.black, // Set the text color to black
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),

          style: ElevatedButton.styleFrom(
            primary: Colors.green.shade700,
            // Button color
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
