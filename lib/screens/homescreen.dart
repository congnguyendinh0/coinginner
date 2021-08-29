import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';
import 'package:coinginner_flutter/screens/news_screen_update.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/controllers/homescreen_controller.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  final controller = Get.put(HomescreenController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              CoinScreen(),
              SearchScreen(),
              NewsScreenUpdate(),
              GlossaryScreen(),
              ExchangeListScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 3,
          backgroundColor: Color(0xff340b93),
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.new_releases),
              label: 'EXPLORE',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Glossary',
            ),
          ],
        ),
      );
    });
  }
}
