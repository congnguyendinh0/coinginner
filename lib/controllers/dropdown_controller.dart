import 'package:get/get.dart';

class DropdownController extends GetxController {
  // standard value
  // .obs makes the value observable, now we can check if it is changing
  final orderDropdownValue = "market_cap_desc".obs;

  // .obs makes the value observable, now we can check if it is changing
  final currencyDropdownValue = "usd".obs;

  static DropdownController get to => Get.find<DropdownController>();

  @override
  void onInit() {
    super.onInit();
  }

// set the order on change
  setOrder(String order) {
    orderDropdownValue(order);
  }

// set the currency on change
  setCurrency(String currency) {
    currencyDropdownValue(currency);
  }
}
