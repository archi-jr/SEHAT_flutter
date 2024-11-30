// import 'package:flutter/material.dart';
//
// class CurrentMedicinePage extends StatelessWidget {
//   const CurrentMedicinePage({Key? key}) : super(key: key);
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
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Current Medicine',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Divider(
//               thickness: 2,
//               color: Colors.black,
//             ),
//             SizedBox(height: 16),
//             // GridView for medicine items
//             Expanded(
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 children: const [
//                   MedicineCard(
//                       medicineName: 'Ibuprofen', times: '3 times today'),
//                   MedicineCard(
//                       medicineName: 'Paracetamol', times: '2 times today'),
//                   MedicineCard(medicineName: 'Benadryl', times: '1 time today'),
//                   MedicineCard(medicineName: 'Advil', times: '3 times today'),
//                   MedicineCard(medicineName: 'Aspirin', times: '3 times today'),
//                   MedicineCard(
//                       medicineName: 'Cetirizine', times: '2 times today'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MedicineCard extends StatelessWidget {
//   final String medicineName;
//   final String times;
//
//   const MedicineCard({
//     Key? key,
//     required this.medicineName,
//     required this.times,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       color: Colors.green.shade700,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Replace these Icons with proper medicine icons
//             Icon(Icons.medical_services, size: 40, color: Colors.black),
//             SizedBox(height: 8),
//             Text(
//               medicineName,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//             SizedBox(height: 4),
//             Text(
//               times,
//               style: TextStyle(fontSize: 14, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CurrentMedicinePage extends StatefulWidget {
  @override
  _CurrentMedicinePageState createState() => _CurrentMedicinePageState();
}

class _CurrentMedicinePageState extends State<CurrentMedicinePage> {
  // Boolean values to track checkbox states
  bool _ibuprofenChecked = false;
  bool _advilChecked = false;
  bool _aspirinChecked = false;
  bool _paracetamolChecked = false;
  bool _cetrizineChecked = false;

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
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Medicines',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            SizedBox(height: 7),

            // Morning Section
            Text(
              'Morning',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 7),
            _buildMedicineTile(
              'Ibuprofen at 8:00am',
              _ibuprofenChecked,
              (value) {
                setState(() {
                  _ibuprofenChecked = value!;
                });
              },
            ),
            _buildMedicineTile(
              'Advil at 9:00am',
              _advilChecked,
              (value) {
                setState(() {
                  _advilChecked = value!;
                });
              },
            ),
            SizedBox(height: 7),

            // Evening Section
            Text(
              'Evening',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 7),
            _buildMedicineTile(
              'Aspirin at 5:00pm',
              _aspirinChecked,
              (value) {
                setState(() {
                  _aspirinChecked = value!;
                });
              },
            ),
            _buildMedicineTile(
              'Paracetamol at 7:00pm',
              _paracetamolChecked,
              (value) {
                setState(() {
                  _paracetamolChecked = value!;
                });
              },
            ),
            SizedBox(height: 7),

            // Night Section
            Text(
              'Night',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 7),
            _buildMedicineTile(
              'Cetrizine at 11:00pm',
              _cetrizineChecked,
              (value) {
                setState(() {
                  _cetrizineChecked = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicineTile(
      String title, bool isChecked, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: onChanged,
              activeColor: Colors.yellow,
              checkColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
