import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/collection_center_service/collection_center_repository.dart';
import 'package:proyectos_amor/services/collection_center_service/models/collection_center_response.dart';

@injectable
class CollectionCenterService {
  final ICollectionCenterRepository _repository;

  CollectionCenterService(this._repository);

  Future<List<CollectionCenterResponse>> getCollectionCenters() =>
      _repository.getCollectionCenters();
}
