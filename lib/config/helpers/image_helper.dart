import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  /// Attempts to optimize an image if it exceeds the maximum allowed size.
  /// Returns the optimized [File] or `null` if it couldn't be compressed below the limit.
  static Future<File?> getOptimizedImage(
    File file, {
    int maxSizeBytes = 1024 * 1024, // 1 MB default
  }) async {
    var sizeInBytes = await file.length();

    if (sizeInBytes <= maxSizeBytes) {
      return file;
    }

    final tempDir = await getTemporaryDirectory();
    final targetPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    var quality = 85;
    File? compressedFile;

    // Iterative compression process (maximum 3 attempts)
    for (var i = 0; i < 3; i++) {
      final result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        targetPath,
        quality: quality,
        format: CompressFormat.jpeg,
      );

      if (result != null) {
        compressedFile = File(result.path);
        sizeInBytes = await compressedFile.length();
        
        if (sizeInBytes <= maxSizeBytes) {
          return compressedFile;
        }
        
        quality -= 20; // Reduce quality for the next attempt
      }
    }

    // Returns the file only if it meets the size requirement
    return (sizeInBytes <= maxSizeBytes) ? compressedFile : null;
  }
}
