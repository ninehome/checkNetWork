import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../widget/sr_scaffold.dart';
import '../controllers/web_kf_controller.dart';

class WebKfView extends GetView {
  WebKfView({Key? key}) : super(key: key);

  final WebKfController controller = Get.put(WebKfController());
  @override
  Widget build(BuildContext context) {
    return SrScaffold.scaffold(

        body: Obx(() {
          return SafeArea(
              child: Column(
                children: [


                  SizedBox(height: 40.w,),
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w),
                        alignment: Alignment.centerLeft,
                        child: Image.asset("assets/images/icon_back_black.png",width: 40.w,height: 40.w,),)),

                  Expanded(
                    child: InAppWebView(
                      key: controller.webViewKey,
                      initialUrlRequest:
                      URLRequest(url: WebUri(controller.webUrl.value)),
                      initialSettings: InAppWebViewSettings(
                        useShouldOverrideUrlLoading: true,
                        javaScriptEnabled: true,
                        domStorageEnabled: true,
                        thirdPartyCookiesEnabled: true,
                        userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
                            "(KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
                      ),
                      initialUserScripts:
                      UnmodifiableListView<UserScript>([]),
                      initialOptions: controller.options,
                      onWebViewCreated: (con) {
                        controller.webViewController = con;
                      },
                      onLoadStart: (con, url) {
                        controller.webUrl.value = url.toString();
                      },
                      shouldInterceptAjaxRequest: (InAppWebViewController con,
                          AjaxRequest ajaxRequest) async {
                      },
                      onAjaxReadyStateChange: (InAppWebViewController con,
                          AjaxRequest ajaxRequest) async {
                        var apiName = ajaxRequest.url.toString();

                      },
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      shouldOverrideUrlLoading:
                          (con, navigationAction) async {
                        var uri = navigationAction.request.url!;
                        if (![
                          "http",
                          "https",
                          "file",
                          "chrome",
                          "data",
                          "javascript",
                          "about"
                        ].contains(uri.scheme)) {
                        } else
                          return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (con, url) async {
                        controller.webUrl.value = url.toString();
                      },

                      onLoadError: (controller, url, code, message) {

                        
                      },
                      onProgressChanged: (con, progress) {
                        print("webview加载地址 ${controller.webUrl.value} ${progress}");

                      },
                      onUpdateVisitedHistory: (con, url, androidIsReload) {
                        controller.webUrl.value = url.toString();
                      },
                      onConsoleMessage: (con, consoleMessage) {
                        print(consoleMessage);
                      },
                    ),
                  ),
                ],
              ));
        })
    );
  }
}
