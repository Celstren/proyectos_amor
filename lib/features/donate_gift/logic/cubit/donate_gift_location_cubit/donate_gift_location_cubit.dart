import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/services/collection_center_service/models/collection_center_response.dart';

extension CollectionCenterDonationExtension on CollectionCenterResponse {
  String get collectionCenterId => id;

  String get confirmText => '$alias\n$address';
}

class DonateGiftLocationCubit extends Cubit<CollectionCenterResponse?> {
  DonateGiftLocationCubit() : super(null);

  void change(CollectionCenterResponse? location) => emit(location);
}
