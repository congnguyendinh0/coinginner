import 'package:get/get.dart';

class SearchUrlController extends GetxController {
  // initial value is bitcoin we make it observable by adding obs
  final url = "Bitcoin".obs;

  static SearchUrlController get to => Get.find<SearchUrlController>();

  @override
  void onInit() {
    super.onInit();
  }

  // onchange the value of the url will be set to bitcoin
  setUrl(String id) {
    url(id);
  }
}
