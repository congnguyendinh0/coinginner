import 'package:get/get.dart';

class SearchUrlController extends GetxController {
  final url = "Bitcoin".obs;

  static SearchUrlController get to => Get.find<SearchUrlController>();

  @override
  void onInit() {
    super.onInit();
  }

  setUrl(String id) {
    url(id);
  }
}
