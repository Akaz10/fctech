import 'package:fctech/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FCTech',
          theme: ThemeData(fontFamily: 'Sora'),
          home: HomePage(),
        );
      },
    );
  }
}