import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SOS extends StatelessWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Need Help',
          style: TextStyle(
            color: Colors.black, // Set the text color to black
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            launchUrl(Uri(scheme: 'tel', path: "112"),
                mode: LaunchMode.externalApplication);
          },
          child: Text(
            'Call Ambulance',
            style: TextStyle(
              color: Colors.black, // Set the text color to black
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
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
