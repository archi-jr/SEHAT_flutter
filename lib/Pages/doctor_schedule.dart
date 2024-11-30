import 'package:flutter/material.dart';

class MySchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.purple.shade300),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.purple.shade300),
            onPressed: () {
              // Perform action for settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page title
            Text(
              'My Schedule',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(thickness: 2, color: Colors.black),
            SizedBox(height: 10),

            // Text for "Choose Slot" section (non-interactive)
            Text(
              'View Slot:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Time slots as containers
            Expanded(
              child: ListView(
                children: [
                  _buildTimeSlot('10:00 AM'),
                  _buildTimeSlot('10:30 AM'),
                  _buildTimeSlot('11:00 AM'),
                  _buildTimeSlot('12:00 PM'),
                  _buildTimeSlot('01:00 PM'),
                  _buildTimeSlot('04:00 PM'),
                  _buildTimeSlot('05:00 PM'),
                  _buildTimeSlot('06:00 PM'),
                  _buildTimeSlot('07:00 PM'),
                  _buildTimeSlot('08:00 PM'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for time slots
  Widget _buildTimeSlot(String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.purple.shade500,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
