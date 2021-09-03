import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/more_screen.dart';
import 'package:coinginner_flutter/screens/news_screen_update.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:coinginner_flutter/screens/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/controllers/homescreen_controller.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  //  for the bottom navigaton bar followed tutorial of https://www.youtube.com/watch?v=XHB09Cyji0g&ab_channel=dbestech

  // init controller
  final controller = Get.put(HomescreenController());
  @override
  Widget build(BuildContext context) {
    // GetBuilder
    // no need of a stateful Widget

    //Homecontroller tracks the change of the navigation bar stack index
    // Getbuilder tracks the change and rebuilds our page

    //index stack is showing only one child at a time with the clicking on the  selected nav item
    // we can select which one

    return GetBuilder<HomescreenController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.stackpage,
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
          // takes the value of the current stack page index from the controller
          currentIndex: controller.stackpage,
          //  every time we click on an item the  index will be the same value  as the page chosen

          onTap: controller.movestackpage,
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
