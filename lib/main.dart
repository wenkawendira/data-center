import 'package:ehr_mobile/view/screens/LoginPage.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import 'package:ehr_mobile/view/screens/pemeriksaan.dart';
import 'package:flutter/material.dart';

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
      home: Pemeriksaan()
    );
  }
}
