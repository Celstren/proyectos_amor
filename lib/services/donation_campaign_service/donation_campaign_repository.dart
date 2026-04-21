import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/create_donation_campaign_request.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/donation_campaign_response.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/list_donation_campaigns_request.dart';

abstract class IDonationCampaignRepository {
  Future<List<DonationCampaignResponse>> getDonationCampaigns({
    ListDonationCampaignsRequest request,
  });

  Future<DonationCampaignResponse> createDonationCampaign(
    CreateDonationCampaignRequest request,
  );
}

@LazySingleton(as: IDonationCampaignRepository)
class DonationCampaignRepository implements IDonationCampaignRepository {
  final DioClient _dioClient;

  DonationCampaignRepository(this._dioClient);

  @override
  Future<List<DonationCampaignResponse>> getDonationCampaigns({
    ListDonationCampaignsRequest request = const ListDonationCampaignsRequest(),
  }) async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/donation-campaigns',
      queryParams: request.toQueryParams(),
      applyToken: false,
    );
    final campaigns = response.data as List<dynamic>;

    return campaigns
        .map(
          (campaign) => DonationCampaignResponse.fromJson(
            campaign as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<DonationCampaignResponse> createDonationCampaign(
    CreateDonationCampaignRequest request,
  ) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/donation-campaigns',
      body: request.toJson(),
    );

    return DonationCampaignResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
  }
}
