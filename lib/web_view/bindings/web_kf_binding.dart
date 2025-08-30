import 'package:get/get.dart';

import '../controllers/web_kf_controller.dart';

class WebKfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WebKfController());
  }
}
