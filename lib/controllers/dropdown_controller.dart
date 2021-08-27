import 'package:get/get.dart';

class DropdownController extends GetxController {
  final orderDropdownValue = "market_cap_desc".obs;

  static DropdownController get to => Get.find<DropdownController>();

  @override
  void onInit() {
    super.onInit();
  }

  setValue(String order) {
    orderDropdownValue(order);
  }
}
