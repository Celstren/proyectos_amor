import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_sentry.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/donation_campaign_service/donation_campaign_service.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/create_donation_campaign_request.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/donation_campaign_response.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/list_donation_campaigns_request.dart';

part 'donation_campaigns_bloc.freezed.dart';

@freezed
class DonationCampaignsEvent with _$DonationCampaignsEvent {
  /// Loads donation campaigns using optional backend filters.
  const factory DonationCampaignsEvent.fetchDonationCampaigns({
    @Default(ListDonationCampaignsRequest())
    ListDonationCampaignsRequest request,
  }) = FetchDonationCampaigns;

  /// Reloads donation campaigns using the latest applied filters.
  const factory DonationCampaignsEvent.refreshDonationCampaigns() =
      RefreshDonationCampaigns;

  /// Creates a new donation campaign. This endpoint is restricted to admins.
  const factory DonationCampaignsEvent.createDonationCampaign({
    required CreateDonationCampaignRequest request,
  }) = CreateDonationCampaign;
}

@freezed
class DonationCampaignsState with _$DonationCampaignsState {
  const factory DonationCampaignsState.donationCampaignsUninitializedState() =
      DonationCampaignsUninitializedState;
  const factory DonationCampaignsState.donationCampaignsLoadingState() =
      DonationCampaignsLoadingState;
  const factory DonationCampaignsState.donationCampaignsSuccessState({
    required List<DonationCampaignResponse> campaigns,
    required ListDonationCampaignsRequest request,
  }) = DonationCampaignsSuccessState;
  const factory DonationCampaignsState.createDonationCampaignLoadingState() =
      CreateDonationCampaignLoadingState;
  const factory DonationCampaignsState.createDonationCampaignSuccessState({
    required DonationCampaignResponse campaign,
  }) = CreateDonationCampaignSuccessState;
  const factory DonationCampaignsState.donationCampaignsErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = DonationCampaignsErrorState;
}

/// [DonationCampaignsBloc] manages donation campaign flows.
///
/// It keeps campaign screens decoupled from the API layer by:
/// 1. Loading campaigns from [DonationCampaignService] with optional filters.
/// 2. Refreshing the latest filter set without duplicating UI logic.
/// 3. Creating admin-only campaigns through the same service boundary.
/// 4. Reporting API failures to Sentry while exposing friendly UI states.
@injectable
class DonationCampaignsBloc
    extends Bloc<DonationCampaignsEvent, DonationCampaignsState> {
  DonationCampaignsBloc(this._donationCampaignService)
      : super(const DonationCampaignsUninitializedState()) {
    on<DonationCampaignsEvent>(_onDonationCampaignsEvent);
  }

  final DonationCampaignService _donationCampaignService;
  ListDonationCampaignsRequest _currentRequest =
      const ListDonationCampaignsRequest();

  void _onDonationCampaignsEvent(
    DonationCampaignsEvent event,
    Emitter<DonationCampaignsState> emitter,
  ) async {
    try {
      await event.when(
        fetchDonationCampaigns: (request) async {
          _currentRequest = request;
          emitter(const DonationCampaignsLoadingState());
          final campaigns = await _donationCampaignService.getDonationCampaigns(
            request: request,
          );
          emitter(
            DonationCampaignsSuccessState(
              campaigns: campaigns,
              request: request,
            ),
          );
        },
        refreshDonationCampaigns: () async {
          emitter(const DonationCampaignsLoadingState());
          final campaigns = await _donationCampaignService.getDonationCampaigns(
            request: _currentRequest,
          );
          emitter(
            DonationCampaignsSuccessState(
              campaigns: campaigns,
              request: _currentRequest,
            ),
          );
        },
        createDonationCampaign: (request) async {
          emitter(const CreateDonationCampaignLoadingState());
          final campaign =
              await _donationCampaignService.createDonationCampaign(request);
          emitter(CreateDonationCampaignSuccessState(campaign: campaign));
        },
      );
    } catch (e, stackTrace) {
      final error = AppApiError.fromException(e);
      await AppSentry.captureApiError(
        error: error,
        exception: e,
        stackTrace: stackTrace,
        feature: 'donationCampaigns',
        operation: _operationNameFor(event),
      );
      emitter(
        DonationCampaignsErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }

  String _operationNameFor(DonationCampaignsEvent event) => event.when(
        fetchDonationCampaigns: (_) => 'fetchDonationCampaigns',
        refreshDonationCampaigns: () => 'refreshDonationCampaigns',
        createDonationCampaign: (_) => 'createDonationCampaign',
      );
}
