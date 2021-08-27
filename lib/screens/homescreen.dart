import 'package:coinginner_flutter/screens/cryptocurrency_list_screen.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coinginner_flutter/controllers/homescreen_controller.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomescreenController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [CoinScreen(), SearchScreen(), NewsScreen()],
        )),
      );
    });
  }
}
