import 'package:get/get.dart';

class DropdownController extends GetxController {
  // standard value
  final orderDropdownValue = "market_cap_desc".obs;
  final currencyDropdownValue = "usd".obs;

  static DropdownController get to => Get.find<DropdownController>();

  @override
  void onInit() {
    super.onInit();
  }

// set the value on change
  setOrder(String order) {
    orderDropdownValue(order);
  }

  setCurrency(String currency) {
    currencyDropdownValue(currency);
  }
}
