import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'globe_controller.dart';

class AppInitBinding extends Bindings {
  AppInitBinding(this.context);

  final BuildContext context;

  @override
  void dependencies() {
    Get.put(GlobeController(context));
  }
}