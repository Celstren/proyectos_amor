import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/donation_service/donation_repository.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:proyectos_amor/services/donation_service/models/list_donations_request.dart';
import 'package:proyectos_amor/services/donation_service/models/paginated_donations_response.dart';

@injectable
class DonationService {
  final IDonationRepository _repository;

  DonationService(this._repository);

  Future<PaginatedDonationsResponse> getUserDonations({
    ListDonationsRequest request = const ListDonationsRequest(),
  }) =>
      _repository.getUserDonations(request: request);

  Future<DonationResponse> getDonationDetail(String donationId) =>
      _repository.getDonationDetail(donationId);

  Future<DonationResponse> createDonation(CreateDonationRequest request) =>
      _repository.createDonation(request);
}
