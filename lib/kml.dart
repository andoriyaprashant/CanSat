// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// class KMLFileManager {
//   // Function to get the directory for saving files
//   static Future<String> _getLocalPath() async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

// Future<String> readFile(String filePath) async {
//   try {
//     final file = File(filePath);
//     String contents = await file.readAsString();
//     return contents;
//   } catch (e) {
//     print("Error reading file: $e");
//     return '';
//   }
// }



// Future<File> saveKMLData(String kmlData) async {
//   try {
//     Directory? downloadsDirectory = await getDownloadsDirectory();
//     String filePath = '${downloadsDirectory?.path}/data.kml';
//     File file = File(filePath);
//     await file.writeAsString(kmlData);
//     return file;
//   } catch (e) {
//     print("Error saving file: $e");
//     throw e;
//   }
// }

// void main() async {
//   String kmlData = '<kml>Our KML data</kml>'; 
//   try {
//     File savedFile = await saveKMLData(kmlData);
//     print("KML data saved to: ${savedFile.path}");
//   } catch (e) {
//     print("Failed to save KML data: $e");
//   }
// }


//   // Function to save KML data to a file
//   static Future<void> saveKMLData(String data) async {
//     final path = await _getLocalPath();
//     final file = File('$path/data.kml');
//     await file.writeAsString(data);
//   }
  
//   Future<void> saveKMLFile(Uint8List kmlBytes) async {
//   try {
//     final downloadsDirectory = await getExternalStorageDirectory();
//     final kmlFile = File('${downloadsDirectory!.path}/data.kml');
//     await kmlFile.writeAsBytes(kmlBytes);
//     print('KML file saved successfully at: ${kmlFile.path}');
//   } catch (e) {
//     print('Error saving KML file: $e');
//   }
// }

//   // Function to read KML data from a file
//   static Future<String?> readKMLData() async {
//     try {
//       final path = await _getLocalPath();
//       final file = File('$path/data.kml');
//       return await file.readAsString();
//     } catch (e) {
//       print('Error reading KML data: $e');
//       return null;
//     }
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('KML File Manager'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   // Save KML data
//                   String kmlData = '<kml><Placemark><name>My Placemark</name></Placemark></kml>';
//                   await KMLFileManager.saveKMLData(kmlData);
//                   print('KML data saved.');
//                 },
//                 child: Text('Save KML Data'),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Read KML data
//                   String? savedData = await KMLFileManager.readKMLData();
//                   if (savedData != null) {
//                     print('KML data read: $savedData');
//                   } else {
//                     print('Failed to read KML data.');
//                   }
//                 },
//                 child: Text('Read KML Data'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
