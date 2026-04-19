import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/file_service/models/upload_response.dart';

abstract class IFileRepository {
  Future<UploadResponse> uploadFile({
    required File file,
    required String bucket,
    required String fileType,
  });
}

@LazySingleton(as: IFileRepository)
class FileRepository implements IFileRepository {
  final DioClient _dioClient;

  FileRepository(this._dioClient);

  @override
  Future<UploadResponse> uploadFile({
    required File file,
    required String bucket,
    required String fileType,
  }) async {
    final fileName = file.path.split('/').last;
    final mimeType = fileName.split('.').last;
    final fileSize = await file.length();

    final response = await _dioClient.upload(
      '${AppConstants.baseURL}/files/upload',
      path: file.path,
      data: {
        'bucket': bucket,
        'fileType': fileType,
        'mimeType': mimeType,
        'fileSize': fileSize.toString(),
      },
    );

    return UploadResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
