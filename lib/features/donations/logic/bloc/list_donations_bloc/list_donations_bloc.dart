import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/donation_service/donation_service.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:proyectos_amor/services/donation_service/models/list_donations_request.dart';
import 'package:proyectos_amor/services/donation_service/models/paginated_donations_response.dart';

part 'list_donations_bloc.freezed.dart';

@freezed
class ListDonationsEvent with _$ListDonationsEvent {
  /// Loads donations using the provided filters and pagination values.
  const factory ListDonationsEvent.fetchDonations({
    @Default(ListDonationsRequest()) ListDonationsRequest request,
  }) = FetchDonations;

  /// Reloads the first page while keeping the current filters.
  const factory ListDonationsEvent.refreshDonations() = RefreshDonations;

  /// Loads the next page and appends it to the current list.
  const factory ListDonationsEvent.fetchNextPage() = FetchNextPage;
}

@freezed
class ListDonationsState with _$ListDonationsState {
  const factory ListDonationsState.listDonationsUninitializedState() =
      ListDonationsUninitializedState;
  const factory ListDonationsState.listDonationsLoadingState() =
      ListDonationsLoadingState;
  const factory ListDonationsState.listDonationsSuccessState({
    required List<DonationResponse> donations,
    required PaginationMeta meta,
    required ListDonationsRequest request,
    @Default(false) bool isLoadingMore,
  }) = ListDonationsSuccessState;
  const factory ListDonationsState.listDonationsErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = ListDonationsErrorState;
}

/// [ListDonationsBloc] manages the donation listing flow.
///
/// It keeps pagination and filters in one place so the UI can:
/// 1. Load the first page of donations.
/// 2. Apply date and status filters through [ListDonationsRequest].
/// 3. Refresh the current filter set.
/// 4. Append the next page when [PaginationMeta.hasNextPage] is true.
@injectable
class ListDonationsBloc extends Bloc<ListDonationsEvent, ListDonationsState> {
  ListDonationsBloc(this._donationService)
      : super(const ListDonationsUninitializedState()) {
    on<ListDonationsEvent>(_onListDonationsEvent);
  }

  final DonationService _donationService;
  ListDonationsRequest _currentRequest = const ListDonationsRequest();

  void _onListDonationsEvent(
    ListDonationsEvent event,
    Emitter<ListDonationsState> emitter,
  ) async {
    try {
      await event.when(
        fetchDonations: (request) async {
          _currentRequest = request;
          emitter(const ListDonationsLoadingState());
          final response = await _donationService.getUserDonations(
            request: request,
          );
          emitter(
            ListDonationsSuccessState(
              donations: response.items,
              meta: response.meta,
              request: request,
            ),
          );
        },
        refreshDonations: () async {
          final request = _currentRequest.copyWith(page: 1);
          _currentRequest = request;
          emitter(const ListDonationsLoadingState());
          final response = await _donationService.getUserDonations(
            request: request,
          );
          emitter(
            ListDonationsSuccessState(
              donations: response.items,
              meta: response.meta,
              request: request,
            ),
          );
        },
        fetchNextPage: () async {
          final currentState = state;
          if (currentState is! ListDonationsSuccessState ||
              !currentState.meta.hasNextPage ||
              currentState.isLoadingMore) {
            return;
          }

          final request = currentState.request.copyWith(
            page: currentState.meta.page + 1,
          );
          emitter(currentState.copyWith(isLoadingMore: true));

          final response = await _donationService.getUserDonations(
            request: request,
          );
          _currentRequest = request;

          emitter(
            ListDonationsSuccessState(
              donations: [
                ...currentState.donations,
                ...response.items,
              ],
              meta: response.meta,
              request: request,
            ),
          );
        },
      );
    } catch (e) {
      final error = AppApiError.fromException(e);
      emitter(
        ListDonationsErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}
