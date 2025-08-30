import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:push_pic_video/routers/app_routers.dart';
import '../../widget/sr_scaffold.dart';
import '../logic/launch_logic.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  late LaunchLogic logic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logic = Get.put(LaunchLogic());
  }

  @override
  Widget build(BuildContext context) {
    return SrScaffold.scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [


          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){

              Get.toNamed(AppRouter.webKfView);
            },
            child: Container(
              height: 100.w,
              width: double.infinity,
              margin: EdgeInsets.only(left: 64.w,right: 64.w,top: 150.w),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(24.w), // 设置圆角半径
              ),

              child: Center(child: Text("Webview的加载状态，用于检测链接访问是否正常",style: TextStyle(color: Colors.white,fontSize: 14),)),),
          ),



          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){

              Get.toNamed(AppRouter.selectPictureView);

            },
            child: Container(
              height: 100.w,
              width: double.infinity,
              margin: EdgeInsets.only(left: 64.w,right: 64.w,top: 150.w),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(24.w), // 设置圆角半径
              ),

              child: Center(child: Text("选择相册文件（图片和视频）上传",style: TextStyle(color: Colors.white,fontSize: 14),)),),
          )


        ],),
      ),

    );
  }
}