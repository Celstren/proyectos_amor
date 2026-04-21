import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/collection_center_service/models/collection_center_response.dart';

abstract class ICollectionCenterRepository {
  Future<List<CollectionCenterResponse>> getCollectionCenters();
}

@LazySingleton(as: ICollectionCenterRepository)
class CollectionCenterRepository implements ICollectionCenterRepository {
  final DioClient _dioClient;

  CollectionCenterRepository(this._dioClient);

  @override
  Future<List<CollectionCenterResponse>> getCollectionCenters() async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/collection-centers',
    );
    final collectionCenters = response.data as List<dynamic>;

    return collectionCenters
        .map(
          (collectionCenter) => CollectionCenterResponse.fromJson(
            collectionCenter as Map<String, dynamic>,
          ),
        )
        .toList();
  }
}
