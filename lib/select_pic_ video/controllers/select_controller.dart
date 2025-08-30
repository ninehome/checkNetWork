

import 'dart:typed_data';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:video_player/video_player.dart';
import '../../../globe_controller.dart';
import 'dart:html' as html; //
import 'dart:io' as io;

class SelectController extends GetxController {
  final count = 0.obs;

  final GlobalKey webViewKey = GlobalKey();

  final toKfUrlTitle = "web".obs;

  GlobeController globeController = Get.find<GlobeController>();


  final  backArrow = "assets/images/icon_back_black.png".obs;

  final imagePath ="".obs;


  final fileBytes = Rxn<Uint8List>();  // 专门用来存可空值
  final filePath = RxnString();       // 移动端用
  final fileName = RxnString();       // 公共文件名
  final isVideo = false.obs;

  VideoPlayerController? videoController;
  ChewieController? chewieController;
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4', 'mov'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      fileName.value = file.name;

      if (kIsWeb) {
        fileBytes.value = file.bytes;
        filePath.value = null;
      } else {
        filePath.value = file.path;
        fileBytes.value = null;
      }

      // 判断是不是视频
      isVideo.value = file.extension?.toLowerCase().contains("mp4") == true ||
          file.extension?.toLowerCase().contains("mov") == true;

      // 初始化播放器
      await _initPlayer();
    }
  }

  Future<void> _initPlayer() async {
    // 清理旧的
    await videoController?.dispose();
     chewieController?.dispose();

    if (!isVideo.value) return;

    if (kIsWeb) {
      // Web: 用 Blob URL
      final blob = html.Blob([fileBytes.value]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    } else {
      // 移动端: 用本地文件
      videoController = VideoPlayerController.file(io.File(filePath.value!));
    }

    await videoController!.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: true,
      looping: false,
    );
    update(); // 通知UI刷新
  }

  @override
  void onClose() {
    videoController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }
}
