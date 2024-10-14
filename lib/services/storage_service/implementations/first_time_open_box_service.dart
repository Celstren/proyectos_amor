import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/entities/first_time_open_entity.dart';
import 'package:proyectos_amor/services/storage_service/storage_repository.dart';

@injectable
class FirstTimeOpenBoxService {
  final IInternalStorageRepository _objectBoxRepository;

  FirstTimeOpenBoxService(this._objectBoxRepository);

  int put(FirstTimeOpenEntity data) => _objectBoxRepository.put<FirstTimeOpenEntity>(data);
  List<int> putMany(List<FirstTimeOpenEntity> data) => _objectBoxRepository.putMany<FirstTimeOpenEntity>(data);
  bool remove(int id) => _objectBoxRepository.remove<FirstTimeOpenEntity>(id);
  int removeMany(List<int> ids) => _objectBoxRepository.removeMany<FirstTimeOpenEntity>(ids);
  int removeAll() => _objectBoxRepository.removeAll<FirstTimeOpenEntity>();
  FirstTimeOpenEntity? get(int id) => _objectBoxRepository.get<FirstTimeOpenEntity>(id);
  List<FirstTimeOpenEntity?> getMany(List<int> ids) => _objectBoxRepository.getMany<FirstTimeOpenEntity>(ids);
  List<FirstTimeOpenEntity> getAll() => _objectBoxRepository.getAll<FirstTimeOpenEntity>();
}