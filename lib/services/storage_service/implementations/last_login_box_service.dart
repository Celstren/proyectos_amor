import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/entities/last_login_entity.dart';
import 'package:proyectos_amor/services/storage_service/storage_repository.dart';

@injectable
class LastLoginBoxService {
  final IInternalStorageRepository _objectBoxRepository;

  LastLoginBoxService(this._objectBoxRepository);

  LastLoginEntity? get currentLastLogin => getAll().firstOrNull;
  int put(LastLoginEntity data) {
    removeAll();
    return _objectBoxRepository.put<LastLoginEntity>(data);
  }
  List<int> putMany(List<LastLoginEntity> data) => _objectBoxRepository.putMany<LastLoginEntity>(data);
  bool remove(int id) => _objectBoxRepository.remove<LastLoginEntity>(id);
  int removeMany(List<int> ids) => _objectBoxRepository.removeMany<LastLoginEntity>(ids);
  int removeAll() => _objectBoxRepository.removeAll<LastLoginEntity>();
  LastLoginEntity? get(int id) => _objectBoxRepository.get<LastLoginEntity>(id);
  List<LastLoginEntity?> getMany(List<int> ids) => _objectBoxRepository.getMany<LastLoginEntity>(ids);
  List<LastLoginEntity> getAll() => _objectBoxRepository.getAll<LastLoginEntity>();
}