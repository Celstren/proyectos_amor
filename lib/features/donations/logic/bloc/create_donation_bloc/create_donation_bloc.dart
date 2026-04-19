import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/donation_service/donation_service.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';

part 'create_donation_bloc.freezed.dart';

@freezed
class CreateDonationEvent with _$CreateDonationEvent {
  const factory CreateDonationEvent.createDonation({
    required CreateDonationRequest request,
  }) = CreateDonation;
}

@freezed
class CreateDonationState with _$CreateDonationState {
  const factory CreateDonationState.createDonationUninitializedState() =
      CreateDonationUninitializedState;
  const factory CreateDonationState.createDonationLoadingState() =
      CreateDonationLoadingState;
  const factory CreateDonationState.createDonationSuccessState({
    required DonationResponse donation,
  }) = CreateDonationSuccessState;
  const factory CreateDonationState.createDonationErrorState({
    @Default('') String message,
  }) = CreateDonationErrorState;
}

/// [CreateDonationBloc] coordinates donation creation.
///
/// The BLoC keeps presentation code away from the API layer by:
/// 1. Receiving a validated [CreateDonationRequest] from the feature UI.
/// 2. Sending it through [DonationService], which adds the stored bearer token.
/// 3. Exposing either the created [DonationResponse] or an error state.
@injectable
class CreateDonationBloc
    extends Bloc<CreateDonationEvent, CreateDonationState> {
  CreateDonationBloc(this._donationService)
      : super(const CreateDonationUninitializedState()) {
    on<CreateDonationEvent>(_onCreateDonationEvent);
  }

  final DonationService _donationService;

  void _onCreateDonationEvent(
    CreateDonationEvent event,
    Emitter<CreateDonationState> emitter,
  ) async {
    try {
      await event.when(
        createDonation: (request) async {
          emitter(const CreateDonationLoadingState());

          final donation = await _donationService.createDonation(request);

          emitter(CreateDonationSuccessState(donation: donation));
        },
      );
    } catch (e) {
      emitter(CreateDonationErrorState(message: e.toString()));
    }
  }
}
