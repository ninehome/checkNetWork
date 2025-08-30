import 'package:get/get.dart';

import '../launch_view/view/launch_page.dart';
import '../select_pic_ video/views/select_picture_view.dart';
import '../web_view/views/web_kf_view.dart';


class AppRouter {
  static String launchPage = "/launchPage";

  static String webKfView = "/WebKfView";
  static String selectPictureView = "/SelectPictureView";


}


class GetPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRouter.launchPage, page: () => const LaunchPage()),
    GetPage(name: AppRouter.webKfView, page: () =>  WebKfView()),
    GetPage(name: AppRouter.selectPictureView, page: () =>  SelectPictureView()),

  ];
}