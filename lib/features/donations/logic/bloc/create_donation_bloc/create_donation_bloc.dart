import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/file_extension.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/donation_service/donation_service.dart';
import 'package:proyectos_amor/services/donation_service/models/create_donation_request.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:proyectos_amor/services/file_service/file_service.dart';

part 'create_donation_bloc.freezed.dart';

@freezed
class CreateDonationEvent with _$CreateDonationEvent {
  const factory CreateDonationEvent.createDonation({
    required CreateDonationRequest request,
    @Default([]) List<File> attachments,
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
    String? errorCode,
    int? statusCode,
  }) = CreateDonationErrorState;
}

/// [CreateDonationBloc] coordinates donation creation.
///
/// The BLoC keeps presentation code away from the API layer by:
/// 1. Receiving a validated [CreateDonationRequest] from the feature UI.
/// 2. Uploading optional attachments through [FileService].
/// 3. Sending the donation through [DonationService] with attachment URLs.
/// 4. Exposing either the created [DonationResponse] or an error state.
@injectable
class CreateDonationBloc
    extends Bloc<CreateDonationEvent, CreateDonationState> {
  CreateDonationBloc(
    this._donationService,
    this._fileService,
  ) : super(const CreateDonationUninitializedState()) {
    on<CreateDonationEvent>(_onCreateDonationEvent);
  }

  final DonationService _donationService;
  final FileService _fileService;

  void _onCreateDonationEvent(
    CreateDonationEvent event,
    Emitter<CreateDonationState> emitter,
  ) async {
    try {
      await event.when(
        createDonation: (request, attachments) async {
          emitter(const CreateDonationLoadingState());

          var vouchers = <DonationVoucherRequest>[];

          if (attachments.isNotEmpty) {
            vouchers = await Future.wait(
              attachments.map(
                (attachment) async {
                  final uploadResponse = await _fileService.uploadFile(
                    file: attachment,
                    bucket: 'donations',
                    fileType: attachment.isImage
                        ? 'image'
                        : attachment.isVideo
                            ? 'video'
                            : 'document',
                  );

                  return DonationVoucherRequest(
                    fileUrl: uploadResponse.publicUrl,
                    fileName: attachment.path.split('/').last,
                    fileType: attachment.isImage
                        ? 'image'
                        : attachment.isVideo
                            ? 'video'
                            : 'document',
                    mimeType:
                        '${attachment.dioMediaType.type}/${attachment.dioMediaType.subtype}',
                    fileSize: await attachment.length(),
                    storageKey: uploadResponse.key,
                  );
                },
              ),
            );
          }

          final donation = await _donationService.createDonation(
            request.copyWithVouchers(vouchers),
          );

          emitter(CreateDonationSuccessState(donation: donation));
        },
      );
    } catch (e) {
      final error = AppApiError.fromException(e);
      emitter(
        CreateDonationErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}
