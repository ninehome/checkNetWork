import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:typed_data';
import 'dart:io' as io;

class PickedFileResult {
  final String name;
  final int size;
  final String? path;
  final Uint8List? bytes;  // Web 有效，Android 可选

  PickedFileResult({
    required this.name,
    required this.size,
    this.path,
    this.bytes,
  });
}

Future<PickedFileResult?> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png', 'mp4', 'mov'],
  );

  if (result != null && result.files.isNotEmpty) {
    final file = result.files.first;

    if (kIsWeb) {
      // Web: 没有 path，只能用 bytes
      return PickedFileResult(
        name: file.name,
        size: file.size,
        path: null,
        bytes: file.bytes,
      );
    } else {
      // Android / iOS: 优先用 path
      return PickedFileResult(
        name: file.name,
        size: file.size,
        path: file.path,
        bytes: file.bytes, // 可选
      );
    }
  }
  return null;
}
