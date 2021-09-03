import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/homescreen.dart';
import 'package:coinginner_flutter/screens/more_screen.dart';
import 'package:coinginner_flutter/screens/news_screen_update.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  //ensures tahateverything is binded
  WidgetsFlutterBinding.ensureInitialized();
  // looks for directory
  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  await Hive.openBox<String>('coinBox');

  await Firebase.initializeApp();

  await dotenv.load(fileName: ".env");
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
        bottomAppBarTheme:
            BottomAppBarTheme(color: Color(0xff340b93), elevation: 3),
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
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xffF72585),
        ),
      ),
      home: Homescreen(),
      getPages: [
        GetPage(name: "/", page: () => Homescreen()),
        GetPage(name: "/coinlist", page: () => CoinScreen()),
        GetPage(name: "/search", page: () => SearchScreen()),
        GetPage(name: "/explore", page: () => NewsScreenUpdate()),
        GetPage(name: "/exchangelist", page: () => ExchangeListScreen()),
        GetPage(name: "/glossary", page: () => GlossaryScreen()),
        GetPage(name: "/glossary", page: () => MoreScreen()),
      ],
    );
  }
}
