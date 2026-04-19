import 'dart:io';

import 'package:dio/dio.dart';

extension FileExtension on File {
  String get extension {
    final separated = path.split('.').last.toLowerCase();
    return separated.isNotEmpty ? path.split('.').last.toLowerCase() : '';
  }

  String get normalizedExtension {
    if (extension == 'temp' || extension == 'tmp'){
      return 'mp4';
    }
    return extension;
  }

  DioMediaType get dioMediaType {
    final extension = this.extension;
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return DioMediaType('image', 'jpeg');
      case 'png':
        return DioMediaType('image', 'png');
      case 'gif':
        return DioMediaType('image', 'gif');
      case 'bmp':
        return DioMediaType('image', 'bmp');
      case 'svg':
        return DioMediaType('image', 'svg+xml');
      case 'pdf':
        return DioMediaType('application', 'pdf');
      case 'doc':
      case 'docx':
        return DioMediaType('application', 'msword');
      case 'xls':
      case 'xlsx':
        return DioMediaType('application', 'vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      case 'txt':
        return DioMediaType('text', 'plain');
      case 'mp4':
      case 'temp':
        return DioMediaType('video', 'mp4');
      case 'mp3':
      case 'mpeg':
      case 'x-m4a':
      case 'm4a':
        return DioMediaType('audio', 'm4a');
      default:
        return DioMediaType('application', 'octet-stream'); // Default MIME type
    }
  }

  bool get isImage => dioMediaType.type == 'image';
  bool get isVideo => dioMediaType.type == 'video';
  bool get isAudio => dioMediaType.type == 'audio';
}