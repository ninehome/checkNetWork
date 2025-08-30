import 'package:get/get.dart';

import '../controllers/select_controller.dart';

class WebKfBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SelectController());
  }
}
