import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coinginner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //home: const MyHomePage(title: 'Coinginner'),
      home: const NewsScreen(),
    );
  }
}
