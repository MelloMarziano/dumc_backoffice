import 'package:dumc_backoffice/binding/layout_binding.dart';
import 'package:dumc_backoffice/screens/layout_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBah1KoXCa9S2qph-oi1Zw5GNJT2VvjQhA",
        authDomain: "dumc-acd.firebaseapp.com",
        projectId: "dumc-acd",
        storageBucket: "dumc-acd.appspot.com",
        messagingSenderId: "240269146519",
        appId: "1:240269146519:web:98618e0d8e2495fdb6ecd2",
        measurementId: "G-W4L0KDCX1Z"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dumc BackOficce',
      home: LayoutScreen(),
      initialBinding: LayoutBinding(),
      getPages: AppPages.pages,
    );
  }
}
