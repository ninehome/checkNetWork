import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sr_router_observers.dart';

extension GetExtension on GetInterface {
  /// route history
  List<Route<dynamic>> get history => SrRouterObserver().history;

  /// contain page
  bool containName(String name) {
    return getRouteByName(name) != null;
  }
  /// name to route，from stack head to find
  Route? getRouteByName(String name) {
    var index = history.lastIndexWhere((element) => element.settings.name == name);
    if (index != -1) {
      return history[index];
    }
    return null;
  }
  /// name to route
  List<Route> getRoutesByName(String name) {
    return history.where((element) => element.settings.name == name).toList();
  }
  /// remove page by name from last
  void removeName(String name) {
    var route = getRouteByName(name);
    if (route != null) {
      Get.removeRoute(route);
    }
  }
  /// remove all page by name
  void removeAllName(String name) {
    var routes = getRoutesByName(name);
    for (var o in routes) {
      Get.removeRoute(o);
    }
  }
}