
import 'package:apiapp/HomeScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en' , 'US'),
      fallbackLocale: Locale('ur', 'PK'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}