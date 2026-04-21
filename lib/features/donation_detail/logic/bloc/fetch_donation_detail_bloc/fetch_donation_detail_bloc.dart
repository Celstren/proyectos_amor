import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_sentry.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/donation_service/donation_service.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';

part 'fetch_donation_detail_bloc.freezed.dart';

@freezed
class FetchDonationDetailEvent with _$FetchDonationDetailEvent {
  /// Loads the detail of one donation owned by the authenticated user.
  const factory FetchDonationDetailEvent.fetchDonationDetail({
    required String donationId,
  }) = FetchDonationDetail;
}

@freezed
class FetchDonationDetailState with _$FetchDonationDetailState {
  const factory FetchDonationDetailState.fetchDonationDetailUninitializedState() =
      FetchDonationDetailUninitializedState;
  const factory FetchDonationDetailState.fetchDonationDetailLoadingState() =
      FetchDonationDetailLoadingState;
  const factory FetchDonationDetailState.fetchDonationDetailSuccessState({
    required DonationResponse donation,
  }) = FetchDonationDetailSuccessState;
  const factory FetchDonationDetailState.fetchDonationDetailErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = FetchDonationDetailErrorState;
}

/// [FetchDonationDetailBloc] manages the donation detail loading flow.
///
/// It keeps [DonationDetailPage] decoupled from the API layer by:
/// 1. Receiving the selected donation id from navigation.
/// 2. Requesting the detail through [DonationService].
/// 3. Exposing loading, success or error states for the UI.
@injectable
class FetchDonationDetailBloc
    extends Bloc<FetchDonationDetailEvent, FetchDonationDetailState> {
  FetchDonationDetailBloc(this._donationService)
      : super(const FetchDonationDetailUninitializedState()) {
    on<FetchDonationDetailEvent>(_onFetchDonationDetailEvent);
  }

  final DonationService _donationService;

  void _onFetchDonationDetailEvent(
    FetchDonationDetailEvent event,
    Emitter<FetchDonationDetailState> emitter,
  ) async {
    try {
      await event.when(
        fetchDonationDetail: (donationId) async {
          emitter(const FetchDonationDetailLoadingState());
          final donation = await _donationService.getDonationDetail(donationId);
          emitter(FetchDonationDetailSuccessState(donation: donation));
        },
      );
    } catch (e, stackTrace) {
      final error = AppApiError.fromException(e);
      await AppSentry.captureApiError(
        error: error,
        exception: e,
        stackTrace: stackTrace,
        feature: 'donations',
        operation: 'fetchDonationDetail',
      );
      emitter(
        FetchDonationDetailErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}
