import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/collection_center_service/collection_center_service.dart';
import 'package:proyectos_amor/services/collection_center_service/models/collection_center_response.dart';

part 'collection_centers_bloc.freezed.dart';

@freezed
class CollectionCentersEvent with _$CollectionCentersEvent {
  /// Loads active collection centers from the API.
  const factory CollectionCentersEvent.fetchCollectionCenters({
    @Default(false) bool forceRefresh,
  }) = FetchCollectionCenters;
}

@freezed
class CollectionCentersState with _$CollectionCentersState {
  const factory CollectionCentersState.collectionCentersUninitializedState() =
      CollectionCentersUninitializedState;
  const factory CollectionCentersState.collectionCentersLoadingState() =
      CollectionCentersLoadingState;
  const factory CollectionCentersState.collectionCentersSuccessState({
    required List<CollectionCenterResponse> collectionCenters,
  }) = CollectionCentersSuccessState;
  const factory CollectionCentersState.collectionCentersErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = CollectionCentersErrorState;
}

/// [CollectionCentersBloc] manages the collection center listing flow.
///
/// It keeps the donation gift UI decoupled from the API layer by exposing
/// loading, success and error states for active collection centers.
@injectable
class CollectionCentersBloc
    extends Bloc<CollectionCentersEvent, CollectionCentersState> {
  CollectionCentersBloc(this._collectionCenterService)
      : super(const CollectionCentersUninitializedState()) {
    on<CollectionCentersEvent>(_onCollectionCentersEvent);
  }

  final CollectionCenterService _collectionCenterService;
  List<CollectionCenterResponse> _cachedCollectionCenters = [];

  void _onCollectionCentersEvent(
    CollectionCentersEvent event,
    Emitter<CollectionCentersState> emitter,
  ) async {
    try {
      await event.when(
        fetchCollectionCenters: (forceRefresh) async {
          if (_cachedCollectionCenters.isNotEmpty && !forceRefresh) {
            emitter(
              CollectionCentersSuccessState(
                collectionCenters: _cachedCollectionCenters,
              ),
            );
            return;
          }

          emitter(const CollectionCentersLoadingState());
          final collectionCenters =
              await _collectionCenterService.getCollectionCenters();
          _cachedCollectionCenters = collectionCenters;
          emitter(
            CollectionCentersSuccessState(
              collectionCenters: collectionCenters,
            ),
          );
        },
      );
    } catch (e) {
      final error = AppApiError.fromException(e);
      emitter(
        CollectionCentersErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}
