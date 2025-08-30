import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';



EventBus eventBus = EventBus();
class GlobeController extends GetxController with WidgetsBindingObserver {
  GlobeController(this.context);

  final BuildContext context;






  @override
  void onClose() {

    super.onClose();
  }

  @override
  Future<void> onReady() async {

  }



  @override
  void dispose() {
    super.dispose();
  }







}





