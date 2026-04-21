import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/authentication_service/authentication_service.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/register_request.dart';
import 'package:proyectos_amor/services/file_service/file_service.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:proyectos_amor/services/storage_service/implementations/system_user_box_service.dart';
import 'package:proyectos_amor/services/user_service/models/update_profile_request.dart';
import 'package:proyectos_amor/services/user_service/user_service.dart';

part 'sign_up_bloc.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signUp({
    required String accountType,
    File? profileImage,
  }) = SignUp;
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.signUpUninitializedState() =
      SignUpUninitializedState;
  const factory SignUpState.signUpLoadingState() = SignUpLoadingState;
  const factory SignUpState.signUpSuccessState({
    @Default(false) bool imageUploadFailed,
  }) = SignUpSuccessState;
  const factory SignUpState.signUpErrorState({@Default('') String message}) =
      SignUpErrorState;
}

/// [SignUpBloc] handles the user registration process.
/// The flow follows this priority:
/// 1. Register account via [AuthenticationService].
/// 2. Attempt to upload profile image. If it fails, continue the process.
/// 3. Update the user profile via [UserService].
/// 4. Persist data locally via [SystemUserBoxService].
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
    this._authenticationService,
    this._userService,
    this._systemUserBoxService,
    this._fileService,
  ) : super(const SignUpUninitializedState()) {
    on<SignUpEvent>(_onSignUpEvent);
  }

  final AuthenticationService _authenticationService;
  final UserService _userService;
  final SystemUserBoxService _systemUserBoxService;
  final FileService _fileService;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String get firstName => firstNameController.text.trim();
  String get lastName => lastNameController.text.trim();
  String get email => emailController.text.trim();
  String get bio => bioController.text.trim();
  String get password => passwordController.text.trim();
  String get confirmPassword => confirmPasswordController.text.trim();

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    bioController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  void _onSignUpEvent(SignUpEvent event, Emitter<SignUpState> emitter) async {
    try {
      await event.when(
        signUp: (accountType, profileImage) async {
          emitter(const SignUpLoadingState());

          // 1. Register the account first (priority)
          final request = RegisterRequest(
            email: email,
            password: password,
            accountType: accountType,
          );
          await _authenticationService.register(request: request);

          String? profileImageUrl;
          var imageUploadFailed = false;

          // 2. Attempt to upload image
          if (profileImage != null) {
            try {
              final uploadResponse = await _fileService.uploadFile(
                file: profileImage,
                bucket: 'avatars',
                fileType: 'image',
              );
              profileImageUrl = uploadResponse.publicUrl;
            } catch (e) {
              // If image fails, we continue but mark it as failed
              imageUploadFailed = true;
            }
          }

          // 3. Update profile (with or without image URL)
          await _userService.updateProfile(
            UpdateProfileRequest(
              firstName: firstName,
              lastName: lastName,
              bio: bio,
              profileImageUrl: profileImageUrl,
            ),
          );

          // 4. Fetch final profile sync
          final profile = await _userService.getProfile();

          // 5. Persist locally
          final userEntity = SystemUserEntity(
            userId: profile.id,
            email: profile.email,
            firstName: profile.profile?.firstName ?? '',
            lastName: profile.profile?.lastName ?? '',
            accountType: profile.accountType,
            role: profile.role,
            status: profile.status,
            profileImageUrl: profile.profile?.profileImageUrl,
            bio: profile.profile?.bio ?? '',
            createdAt: profile.createdAt?.toIso8601String() ?? '',
          );
          _systemUserBoxService.put(userEntity);

          emitter(SignUpSuccessState(imageUploadFailed: imageUploadFailed));
        },
      );
    } catch (e) {
      emitter(SignUpErrorState(message: e.toString()));
    }
  }
}
