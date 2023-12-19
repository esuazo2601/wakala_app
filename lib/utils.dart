import 'package:flutter_native_image/flutter_native_image.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

Future<String> toBase64C(String ruta) async {
  if (ruta.isNotEmpty) {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(ruta);
    File compressedFile = await FlutterNativeImage.compressImage(ruta,
        quality: 65,
        targetWidth: 400,
        targetHeight: (properties.height! * 400 / properties.width!).round());
    final bytes = await compressedFile.readAsBytes();
    String img64 = base64Encode(bytes);
    return img64;
  } else {
    return "";
  }
}

ImageProvider? fromBase64C(String base64String) {
  if (base64String.isNotEmpty) {
    List<int> bytes = base64Decode(base64String);
    return MemoryImage(Uint8List.fromList(bytes));
  } else {
    return null;
  }
}
