import 'package:ehr_mobile/view/screens/DaftarPemeriksaan.dart';
import 'package:ehr_mobile/view/screens/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:ehr_mobile/view/screens/TambahPasien.dart';

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
      home: DaftarPemeriksaan()
    );
  }
}
