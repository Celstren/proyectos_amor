import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/storage_repository.dart';

@injectable
class InternalStorageService {
  final IInternalStorageRepository _objectBoxRepository;

  InternalStorageService(this._objectBoxRepository);

  Future<void> init() => _objectBoxRepository.init();
}