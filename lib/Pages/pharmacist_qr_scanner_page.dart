// import 'package:flutter/material.dart';
//
// class ScanQRCodePage_pharma extends StatefulWidget {
//   const ScanQRCodePage_pharma({Key? key}) : super(key: key);
//
//   @override
//   _ScanQRCodePageState createState() => _ScanQRCodePageState();
// }
//
// class _ScanQRCodePageState extends State<ScanQRCodePage_pharma> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//   bool isCameraInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     try {
//       final cameras = await availableCameras();
//       final firstCamera = cameras.first;
//
//       _controller = CameraController(
//         firstCamera,
//         ResolutionPreset.high,
//       );
//
//       _initializeControllerFuture = _controller.initialize();
//       await _initializeControllerFuture;
//       setState(() {
//         isCameraInitialized = true;
//       });
//     } catch (e) {
//       print('Error initializing camera: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan QR Code'),
//         backgroundColor: Colors.white,
//         elevation: 10,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: isCameraInitialized
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Camera Preview
//                 Container(
//                   height: 300,
//                   width: 300,
//                   child: CameraPreview(_controller),
//                 ),
//                 SizedBox(height: 100),
//                 Divider(
//                   thickness: 2,
//                   color: Colors.black,
//                 ),
//                 // Instruction Text
//                 Text(
//                   'Scan the QR Code',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCodePage_pharma extends StatefulWidget {
  const ScanQRCodePage_pharma({Key? key}) : super(key: key);

  @override
  _ScanQRCodePageState createState() => _ScanQRCodePageState();
}

class _ScanQRCodePageState extends State<ScanQRCodePage_pharma> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isQRScanned = false;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isQRScanned) {
        setState(() {
          isQRScanned = true; // Ensure only one scan triggers navigation
        });
        _handleQRCode(scanData.code); // Perform action based on QR code
      }
    });
  }

  void _handleQRCode(String? qrCode) {
    if (qrCode != null) {
      // Example: Navigate to a new page based on the QR code content
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              QRResultPage(result: qrCode), // New page with QR code result
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        backgroundColor: Colors.blue.shade700,
        elevation: 10,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QR Scanner Preview
                Container(
                  height: 300,
                  width: 300,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.green.shade700,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 250,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                  color: Colors.blue.shade700,
                ),
                // Optionally, you can add some text or actions here while scanning is in progress
                Text(
                  'Scan the QR Code',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// A new page to show the result after scanning QR code
class QRResultPage extends StatelessWidget {
  final String result;

  const QRResultPage({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Result'),
      ),
      body: Center(
        child: Text(
          'Scanned Result: $result', // You can replace this with actions based on the result
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
