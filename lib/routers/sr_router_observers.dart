import 'package:flutter/material.dart';

SrRouterObserver srRouterObserver = SrRouterObserver();

class SrRouterObserver extends RouteObserver<PageRoute> {
  List<Route<dynamic>> history = <Route<dynamic>>[];

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    history.add(route);
  }

  @override   //previousRoute 回退到的目的路由
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if(history.isNotEmpty){
      history.removeLast();
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    try {
      history.remove(oldRoute);
      history.add(newRoute!);
    } catch(e) {}
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    try {
      history.remove(route);
    } catch(e) {}

  }
}