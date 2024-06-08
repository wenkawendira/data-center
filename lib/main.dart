import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ehr_mobile/firebase_options.dart';
import 'package:ehr_mobile/view/screens/LoginPage.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ehr_mobile/view/screens/TambahStatus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase setup
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REKMED',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          if (snap.data == null) {
            return const LoginPage();
          } else {
            return const Main();
          }
        },
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/tambahStatus': (context) => const TambahStatus(),
      },
    );
  }
}
