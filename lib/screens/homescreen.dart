import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/more_screen.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';
import 'package:coinginner_flutter/screens/news_screen_update.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:coinginner_flutter/screens/watchlist_screen.dart';
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
              WatchListScreen(),
              MoreScreen()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff340b93),
          elevation: 3,
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list, color: Colors.white),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
