import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/dropdown_screen.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/news_screen_update.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:coinginner_flutter/services/http_coinextra_service.dart';

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
        primaryColor: Color(0xff340b93),
        appBarTheme: AppBarTheme(
            backgroundColor: Color(0xff340b93),
            elevation: 1,
            centerTitle: false),
        scaffoldBackgroundColor: Color(0xff340b93),
        cardTheme: CardTheme(
          color: Color(0xffF72585),
        ),
        chipTheme: ChipThemeData(
          secondaryLabelStyle: TextStyle(color: Colors.white),
          brightness: Brightness.light,
          padding: EdgeInsets.all(3),
          secondarySelectedColor: Color(0xffF72585),
          backgroundColor: Color(0xffF72585),
          labelStyle: TextStyle(color: Colors.white),
          showCheckmark: false,
          disabledColor: Color(0xffF72585),
          selectedColor: Color(0xffF72585),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Color(0xffF72585)),
      ),
      //home: const MyHomePage(title: 'Coinginner'),
      home: NewsScreenUpdate(),
    );
  }
}
