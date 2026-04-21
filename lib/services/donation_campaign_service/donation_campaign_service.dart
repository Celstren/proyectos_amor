import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/donation_campaign_service/donation_campaign_repository.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/create_donation_campaign_request.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/donation_campaign_response.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/list_donation_campaigns_request.dart';

@injectable
class DonationCampaignService {
  final IDonationCampaignRepository _repository;

  DonationCampaignService(this._repository);

  Future<List<DonationCampaignResponse>> getDonationCampaigns({
    ListDonationCampaignsRequest request = const ListDonationCampaignsRequest(),
  }) =>
      _repository.getDonationCampaigns(request: request);

  Future<DonationCampaignResponse> createDonationCampaign(
    CreateDonationCampaignRequest request,
  ) =>
      _repository.createDonationCampaign(request);
}
