import 'package:get/get.dart';

class HomescreenController extends GetxController {
  static HomescreenController get to => Get.find<HomescreenController>();
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
