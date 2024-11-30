// import 'package:flutter/material.dart';
//
// class HealthRecordPage extends StatefulWidget {
//   const HealthRecordPage({Key? key}) : super(key: key);
//
//   @override
//   _HealthRecordPageState createState() => _HealthRecordPageState();
// }
//
// class _HealthRecordPageState extends State<HealthRecordPage> {
//   String? selectedTime;
//
//   // Create a list of time slots from 9:00 AM to 8:00 PM with 30-minute intervals
//   final List<String> timeSlots = [
//     '9:00 AM',
//     '9:30 AM',
//     '10:00 AM',
//     '10:30 AM',
//     '11:00 AM',
//     '11:30 AM',
//     '12:00 PM',
//     '12:30 PM',
//     '1:00 PM',
//     '1:30 PM',
//     '2:00 PM',
//     '2:30 PM',
//     '3:00 PM',
//     '3:30 PM',
//     '4:00 PM',
//     '4:30 PM',
//     '5:00 PM',
//     '5:30 PM',
//     '6:00 PM',
//     '6:30 PM',
//     '7:00 PM',
//     '7:30 PM',
//     '8:00 PM',
//   ];
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
//                 'Health Record',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Divider(
//                 thickness: 2,
//                 color: Colors.black,
//               ),
//               SizedBox(height: 16),
//
//               // Patient details
//               Text('Patient name: Ram '),
//               SizedBox(height: 8),
//               Text('Gender: Male'),
//               SizedBox(height: 8),
//               Text('Weight: 60 kg'),
//               SizedBox(height: 8),
//               Text('Blood Group: A+'),
//               SizedBox(height: 16),
//
//               // Injections field
//               Text('Injections'),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter injections',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Symptoms field
//               Text('Symptoms'),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter symptoms',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Allergies field
//               Text('Allergies'),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Enter allergies',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Appointment time dropdown
//               // Text('Appointment time'),
//               // DropdownButtonFormField<String>(
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(),
//               //   ),
//               //   hint: Text('Select'),
//               //   value: selectedTime,
//               //   items: timeSlots.map((time) {
//               //     return DropdownMenuItem(
//               //       value: time,
//               //       child: Text(time),
//               //     );
//               //   }).toList(),
//               //   onChanged: (newValue) {
//               //     setState(() {
//               //       selectedTime = newValue;
//               //     });
//               //   },
//               // ),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HealthRecordPage extends StatelessWidget {
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
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Health Records',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 30),

            // Basic Medical Details Container
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Basic Medical Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Name : John Doe\n'
                    'Age : 30\n'
                    'Blood Type: B+\n'
                    'Allergies : Egg, Prawn\n'
                    'Summary : Suffers from frequent allergies. Low Immune System.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Buttons for different health records
            _buildButton(
              context,
              'My Health Records',
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHealthRecordsPage()),
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              'Father Health Records',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FatherHealthRecordsPage()),
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              'Mother Health Records',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MotherHealthRecordsPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.green.shade700, // Button color
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}

// Dummy Pages for navigation (Replace with actual pages)

class MyHealthRecordsPage extends StatelessWidget {
  final List<Map<String, String>> records = [
    {
      'date': '20/08/2024',
      'condition': 'Flu',
      'treatment': 'Medication A',
    },
    {
      'date': '15/09/2024',
      'condition': 'Cold',
      'treatment': 'Medication B',
    },
    {
      'date': '05/07/2024',
      'condition': 'Cough',
      'treatment': 'Medication C',
    },
    {
      'date': '12/06/2024',
      'condition': 'Headache',
      'treatment': 'Medication D',
    },
  ];

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
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Health Records',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return _buildHealthRecordCard(records[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthRecordCard(Map<String, String> record) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '● Date : ${record['date']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Condition : ${record['condition']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Treatment : ${record['treatment']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FatherHealthRecordsPage extends StatelessWidget {
  final List<Map<String, String>> records = [
    {
      'date': '20/08/2024',
      'condition': 'Flu',
      'treatment': 'Medication A',
    },
    {
      'date': '15/09/2024',
      'condition': 'Cold',
      'treatment': 'Medication B',
    },
    {
      'date': '05/07/2024',
      'condition': 'Cough',
      'treatment': 'Medication C',
    },
    {
      'date': '12/06/2024',
      'condition': 'Headache',
      'treatment': 'Medication D',
    },
  ];

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
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Father\'s Health Records',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return _buildHealthRecordCard(records[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthRecordCard(Map<String, String> record) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '● Date : ${record['date']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Condition : ${record['condition']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Treatment : ${record['treatment']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MotherHealthRecordsPage extends StatelessWidget {
  final List<Map<String, String>> records = [
    {
      'date': '20/08/2024',
      'condition': 'Flu',
      'treatment': 'Medication A',
    },
    {
      'date': '15/09/2024',
      'condition': 'Cold',
      'treatment': 'Medication B',
    },
    {
      'date': '05/07/2024',
      'condition': 'Cough',
      'treatment': 'Medication C',
    },
    {
      'date': '12/06/2024',
      'condition': 'Headache',
      'treatment': 'Medication D',
    },
  ];

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
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mother\'s Health Records',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return _buildHealthRecordCard(records[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthRecordCard(Map<String, String> record) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '● Date : ${record['date']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Condition : ${record['condition']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '● Treatment : ${record['treatment']}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
