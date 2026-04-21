import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:proyectos_amor/services/donation_service/models/list_donations_request.dart';
import 'package:proyectos_amor/services/donation_service/models/paginated_donations_response.dart';

abstract class IDonationRepository {
  Future<PaginatedDonationsResponse> getUserDonations({
    ListDonationsRequest request,
  });

  Future<DonationResponse> getDonationDetail(String donationId);

  Future<DonationResponse> createDonation(CreateDonationRequest request);
}

@LazySingleton(as: IDonationRepository)
class DonationRepository implements IDonationRepository {
  final DioClient _dioClient;

  DonationRepository(this._dioClient);

  @override
  Future<PaginatedDonationsResponse> getUserDonations({
    ListDonationsRequest request = const ListDonationsRequest(),
  }) async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/donations',
      queryParams: request.toQueryParams(),
    );

    return PaginatedDonationsResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<DonationResponse> getDonationDetail(String donationId) async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/donations/$donationId',
    );

    return DonationResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<DonationResponse> createDonation(CreateDonationRequest request) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/donations',
      body: request.toJson(),
    );

    return DonationResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
