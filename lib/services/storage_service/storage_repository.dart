import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@LazySingleton(as: IInternalStorageRepository)
class InternalStorageRepository implements IInternalStorageRepository {
  late final Store _store;

  @override
  Future<void> init() async {
    final dir = Platform.isAndroid ? (await getApplicationDocumentsDirectory()) : (await getApplicationSupportDirectory());
    _store = await openStore(directory: p.join(dir.path, 'fanlik_obx'));
  }

  @override
  int put<T>(T data) {
    return _store.box<T>().put(data);
  }

  @override
  T? get<T>(int id) {
    return _store.box<T>().get(id);
  }

  @override
  List<T?> getMany<T>(List<int> ids) {
    return _store.box<T>().getMany(ids);
  }

  @override
  List<T> getAll<T>() {
    return _store.box<T>().getAll();
  }

  @override
  List<int> putMany<T>(List<T> data) {
    return _store.box<T>().putMany(data);
  }

  @override
  bool remove<T>(int id) {
    return _store.box<T>().remove(id);
  }

  @override
  int removeMany<T>(List<int> ids) {
    return _store.box<T>().removeMany(ids);
  }

  @override
  int removeAll<T>() {
    return _store.box<T>().removeAll();
  }
}

abstract class IInternalStorageRepository {
  Future<void> init();
  int put<T>(T data);
  List<int> putMany<T>(List<T> data);
  bool remove<T>(int id);
  int removeMany<T>(List<int> ids);
  int removeAll<T>();
  T? get<T>(int id);
  List<T?> getMany<T>(List<int> ids);
  List<T> getAll<T>();
}
