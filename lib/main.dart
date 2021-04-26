import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practise/Bindings/connection_binding.dart';
import 'package:practise/View/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ConnectionBinding(),
      home: HomePage(),
    );
  }
}
