import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/file_service/file_repository.dart';
import 'package:proyectos_amor/services/file_service/models/upload_response.dart';

@injectable
class FileService {
  final IFileRepository _repository;

  FileService(this._repository);

  Future<UploadResponse> uploadFile({
    required File file,
    required String bucket,
    required String fileType,
  }) =>
      _repository.uploadFile(
        file: file,
        bucket: bucket,
        fileType: fileType,
      );
}
