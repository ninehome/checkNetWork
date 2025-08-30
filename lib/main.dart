import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:push_pic_video/routers/app_routers.dart';
import 'package:push_pic_video/routers/sr_router_observers.dart';

import 'app_init_binding.dart';
import 'launch_view/view/launch_page.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

GlobalKey<NavigatorState> navContextKey = GlobalKey();


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 监听应用生命周期
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // 取消监听
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:// 从后台切换前台，界面可见


        break;
      case AppLifecycleState.inactive:

        break;
      case AppLifecycleState.paused: // 界面不可见，后台

        break;
      case AppLifecycleState.detached:

        break;
      case AppLifecycleState.hidden:

        break;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(750,1336),
      // designSize: const Size(402,874),
      builder: (context,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navContextKey,
          theme: ThemeData(
            // brightness: Brightness.dark,
            // 取消按钮的溅射效果
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            // 页面背景色
            scaffoldBackgroundColor: Colors.white,
            dividerColor: Colors.white,
            appBarTheme: const AppBarTheme(
              surfaceTintColor: Colors.transparent,
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              //浮动按钮样式 after v1.13.2. 后不建议使用
              backgroundColor: Colors.blue,
            ),
          ),
          defaultTransition: Transition.cupertino,
          navigatorObservers: [srRouterObserver],
          initialRoute: AppRouter.launchPage,
          initialBinding: AppInitBinding(context),
          getPages: GetPages.getPages,
          color: Colors.white,
          title: "域名检测",
          fallbackLocale: const Locale('zh', 'CN'),
          locale: const Locale('zh', "CN"),
          supportedLocales: const [
            Locale('zh', 'CN'),
          ],
          home:  LaunchPage(),
        );
      },
    );
  }
}
