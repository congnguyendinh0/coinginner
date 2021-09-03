import 'package:get/get.dart';

class HomescreenController extends GetxController {
  static HomescreenController get to => Get.find<HomescreenController>();
  // simple logic
  // initial stackpage is 0
  // when we click on a bottom navigation item the stackpage will be the page chosen
  // update needs to be called because of getbuilder
  var stackpage = 0;
  void movestackpage(int page) {
    stackpage = page;
    update();
  }
}
