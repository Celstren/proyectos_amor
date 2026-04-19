import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';

abstract class IDonationRepository {
  Future<DonationResponse> createDonation(CreateDonationRequest request);
}

@LazySingleton(as: IDonationRepository)
class DonationRepository implements IDonationRepository {
  final DioClient _dioClient;

  DonationRepository(this._dioClient);

  @override
  Future<DonationResponse> createDonation(CreateDonationRequest request) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/donations',
      body: request.toJson(),
    );

    return DonationResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
