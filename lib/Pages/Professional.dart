//import 'package:camera/camera.dart';
import 'package:first_app/Pages/pharmacist_qr_scanner_page.dart';
import 'package:first_app/patient_details_page.dart';
import 'package:flutter/material.dart';

import 'doctor_details_page.dart';
// import 'pharmacist_qr_scanner_page.dart'; // Import the new QR code page

class ProfessionSelectionPage extends StatefulWidget {
  @override
  _ProfessionSelectionPageState createState() =>
      _ProfessionSelectionPageState();
}

class _ProfessionSelectionPageState extends State<ProfessionSelectionPage> {
  String selectedProfession = "";

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
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.web, color: Colors.black),
        //     onPressed: () {
        //       const link = "https://sih-final-chi.vercel.app/";
        //
        //       launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
        //     },
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profession',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select your profession',
              ),
              value: selectedProfession.isNotEmpty ? selectedProfession : null,
              items: [
                DropdownMenuItem(value: 'Doctor', child: Text('Doctor')),
                DropdownMenuItem(value: 'Patient', child: Text('Patient')),
                DropdownMenuItem(
                    value: 'Pharmacist', child: Text('Pharmacist')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedProfession = value!;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (selectedProfession == 'Doctor') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorDetailsPage()),
                  );
                } else if (selectedProfession == 'Patient') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientDetailsPage()),
                  );
                } else if (selectedProfession == 'Pharmacist') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScanQRCodePage_pharma()),
                  );
                }
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.black, // Set the text color to black
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ScanQRCodePage extends StatefulWidget {
//   @override
//   _PharmacistQRScannerPageState createState() =>
//       _PharmacistQRScannerPageState();
// }
//
// class _PharmacistQRScannerPageState extends State<ProfessionSelectionPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   String? qrCodeResult;
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (controller != null) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Scan QR Code',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Expanded(
//             child: _buildQrView(context),
//           ),
//           if (qrCodeResult != null)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text('QR Code Result: $qrCodeResult'),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 250.0
//         : 300.0;
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.green,
//         borderRadius: 10,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: scanArea,
//       ),
//       onPermissionSet: (ctrl, p) {
//         if (!p) {
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Camera Permission Denied')));
//         }
//       },
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         qrCodeResult = scanData.code;
//       });
//     });
//   }
// }
