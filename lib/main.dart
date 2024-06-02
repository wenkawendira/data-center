import 'package:flutter/material.dart';
import 'package:ehr_mobile/view/screens/TambahStatus.dart'; // Ensure the import path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REKMED',
      debugShowCheckedModeBanner: false,
      home: TambahStatus(), // Set TambahStatus as the home screen
    );
  }
}
