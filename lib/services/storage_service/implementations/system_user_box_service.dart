import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:proyectos_amor/services/storage_service/storage_repository.dart';

@injectable
class SystemUserBoxService {
  final IInternalStorageRepository _objectBoxRepository;

  SystemUserBoxService(this._objectBoxRepository);

  SystemUserEntity? get currentSystemUser => getAll().firstOrNull;
  int put(SystemUserEntity data) {
    removeAll();
    return _objectBoxRepository.put<SystemUserEntity>(data);
  }
  List<int> putMany(List<SystemUserEntity> data) => _objectBoxRepository.putMany<SystemUserEntity>(data);
  bool remove(int id) => _objectBoxRepository.remove<SystemUserEntity>(id);
  int removeMany(List<int> ids) => _objectBoxRepository.removeMany<SystemUserEntity>(ids);
  int removeAll() => _objectBoxRepository.removeAll<SystemUserEntity>();
  SystemUserEntity? get(int id) => _objectBoxRepository.get<SystemUserEntity>(id);
  List<SystemUserEntity?> getMany(List<int> ids) => _objectBoxRepository.getMany<SystemUserEntity>(ids);
  List<SystemUserEntity> getAll() => _objectBoxRepository.getAll<SystemUserEntity>();
}