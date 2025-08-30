import 'package:flutter/material.dart';


class SrScaffold {
  static Widget scaffold({
    PreferredSizeWidget? appBar,
    Widget? body,
    Color? backgroundColor,
    bool resizeToAvoidBottomInset = false,
    Widget? drawerWidget,
    Widget? bottomNavigationBar,
    Widget? floatingActionButton,
  }) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar,
      body: body,
      drawer: drawerWidget,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  static Widget investmentScaffold({
    Widget? appBar,
    Widget? body,
    Color? backgroundColor,
  }) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [

        SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            SizedBox(
                width: double.infinity,
                height: 44,
                child: appBar ?? const SizedBox()),
            body ?? const SizedBox(),
          ]),
        )),
      ]),
    );
  }

  static Widget gradientScaffold({
    Widget? appBar,
    Widget? body,
    Color? backgroundColor,
  }) {
    return Scaffold(
      backgroundColor: backgroundColor ??  Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff006ffd),
                Color(0x00006ffd)
              ],
            ),
          ),
        ),
        SafeArea(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                Container(
                    width: double.infinity,
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: appBar ?? const SizedBox()),
                body ?? const SizedBox(),
              ]),
            )),
      ]),
    );
  }


}
