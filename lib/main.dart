import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
      home: const GlossaryScreen(),
    );
  }
}
