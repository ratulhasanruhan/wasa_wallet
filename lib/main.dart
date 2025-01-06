import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasa_wallet/pages/home.dart';
import 'package:wasa_wallet/utils/colors.dart';
import 'package:wasa_wallet/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: app_name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

