import 'package:dumc_backoffice/binding/layout_binding.dart';
import 'package:dumc_backoffice/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';

void main() {
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
