import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/donation_service/donation_repository.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';

@injectable
class DonationService {
  final IDonationRepository _repository;

  DonationService(this._repository);

  Future<DonationResponse> createDonation(CreateDonationRequest request) =>
      _repository.createDonation(request);
}
