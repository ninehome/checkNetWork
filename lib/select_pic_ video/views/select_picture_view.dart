import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../widget/sr_scaffold.dart';
import '../controllers/select_controller.dart';
import 'dart:io' as io;
class SelectPictureView extends GetView {
  SelectPictureView({Key? key}) : super(key: key);

  final SelectController controller = Get.put(SelectController());
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
                        child: Image.asset("${controller.backArrow.value}",width: 40.w,height: 40.w,),)),


                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: (){

                      controller.pickFile();

                    },
                    child: Container(
                      height: 100.w,
                      width: 600.w,
                      margin: EdgeInsets.only(top: 100.w,bottom: 50.w),
                      color: Colors.red,
                      child: Center(child: Text("点击选择图片或视频",style: TextStyle(color: Colors.white,fontSize: 16),)),
                    ),
                  ),


                  Expanded(
                    child: Obx(() {
                      if (controller.fileBytes.value != null) {
                        // Web 图片
                        return Image.memory(controller.fileBytes.value!, fit: BoxFit.contain);
                      } else if (controller.filePath.value != null) {
                        final path = controller.filePath.value!;
                        if (path.endsWith(".mp4") || path.endsWith(".mov")) {
                          return Center(child: Text("选择了视频: ${controller.fileName.value}"));

                        } else {
                          return Image.file(io.File(path), fit: BoxFit.contain);
                        }
                      } else {
                        return Center(child: Text("未选择文件"));
                      }
                    }),
                  ),

                ],
              ));
        })
    );
  }
}
