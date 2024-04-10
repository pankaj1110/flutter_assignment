import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/cart_page.dart';
import 'package:flutter_assignment/screens/history_page.dart';
import 'package:flutter_assignment/screens/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/history', page: () => HistoryPage()),
        GetPage(name: '/cart', page: () => CartPage()),
      ],
    );
  }
}
