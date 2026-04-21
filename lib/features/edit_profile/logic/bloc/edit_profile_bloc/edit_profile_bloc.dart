import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/file_service/file_service.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:proyectos_amor/services/storage_service/implementations/system_user_box_service.dart';
import 'package:proyectos_amor/services/user_service/models/update_profile_request.dart';
import 'package:proyectos_amor/services/user_service/user_service.dart';

part 'edit_profile_bloc.freezed.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.updateProfile({File? newImage}) =
      UpdateProfile;
}

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.editProfileUninitializedState() =
      EditProfileUninitializedState;
  const factory EditProfileState.editProfileLoadingState() =
      EditProfileLoadingState;
  const factory EditProfileState.editProfileSuccessState({
    required SystemUserEntity user,
  }) = EditProfileSuccessState;
  const factory EditProfileState.editProfileErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = EditProfileErrorState;
}

/// [EditProfileBloc] manages the user profile editing process.
@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(
    this._userService,
    this._systemUserBoxService,
    this._fileService,
  ) : super(const EditProfileUninitializedState()) {
    on<EditProfileEvent>(_onEditProfileEvent);
  }

  final UserService _userService;
  final SystemUserBoxService _systemUserBoxService;
  final FileService _fileService;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final bioController = TextEditingController();

  String get firstName => firstNameController.text.trim();
  String get lastName => lastNameController.text.trim();
  String get bio => bioController.text.trim();

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    return super.close();
  }

  void _onEditProfileEvent(
    EditProfileEvent event,
    Emitter<EditProfileState> emitter,
  ) async {
    try {
      await event.when(
        updateProfile: (newImage) async {
          emitter(const EditProfileLoadingState());

          String? profileImageUrl;

          // 1. Upload new image if provided
          if (newImage != null) {
            final uploadResponse = await _fileService.uploadFile(
              file: newImage,
              bucket: 'avatars',
              fileType: 'image',
            );
            profileImageUrl = uploadResponse.publicUrl;
          }

          // 2. Update remote profile
          final profile = await _userService.updateProfile(
            UpdateProfileRequest(
              firstName: firstName,
              lastName: lastName,
              bio: bio,
              profileImageUrl: profileImageUrl,
            ),
          );

          // 3. Map and Persist locally
          final userEntity = SystemUserEntity(
            userId: profile.id,
            email: profile.email,
            firstName: profile.profile?.firstName ?? '',
            lastName: profile.profile?.lastName ?? '',
            accountType: profile.accountType,
            role: profile.role,
            status: profile.status,
            createdAt: profile.createdAt?.toIso8601String() ?? '',
            profileImageUrl: profile.profile?.profileImageUrl ?? '',
            bio: profile.profile?.bio ?? '',
          );

          _systemUserBoxService.put(userEntity);

          emitter(EditProfileSuccessState(user: userEntity));
        },
      );
    } catch (e) {
      final error = AppApiError.fromException(e);
      emitter(
        EditProfileErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }
}
