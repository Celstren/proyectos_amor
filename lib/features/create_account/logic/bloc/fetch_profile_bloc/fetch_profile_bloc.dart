import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/storage_service/entities/system_user_entity.dart';
import 'package:proyectos_amor/services/storage_service/implementations/system_user_box_service.dart';
import 'package:proyectos_amor/services/user_service/user_service.dart';

part 'fetch_profile_bloc.freezed.dart';

@freezed
class FetchProfileEvent with _$FetchProfileEvent {
  /// Fetches the profile data from the local storage (ObjectBox).
  const factory FetchProfileEvent.fetchLocalProfile() = FetchLocalProfile;

  /// Fetches the profile data from the remote server (API).
  const factory FetchProfileEvent.fetchRemoteProfile() = FetchRemoteProfile;
}

@freezed
class FetchProfileState with _$FetchProfileState {
  const factory FetchProfileState.fetchProfileUninitializedState() =
      FetchProfileUninitializedState;
  const factory FetchProfileState.fetchProfileLoadingState() =
      FetchProfileLoadingState;
  const factory FetchProfileState.fetchProfileSuccessState({
    required SystemUserEntity user,
  }) = FetchProfileSuccessState;
  const factory FetchProfileState.fetchProfileErrorState({
    @Default('') String message,
  }) = FetchProfileErrorState;
  const factory FetchProfileState.fetchProfileUnauthorizedState() =
      FetchProfileUnauthorizedState;
}

/// [FetchProfileBloc] handles retrieving user profile information.
/// It supports fetching from local storage for immediate availability
/// and from remote services to ensure data consistency.
@injectable
class FetchProfileBloc extends Bloc<FetchProfileEvent, FetchProfileState> {
  FetchProfileBloc(
    this._userService,
    this._systemUserBoxService,
  ) : super(const FetchProfileUninitializedState()) {
    on<FetchProfileEvent>(_onFetchProfileEvent);
  }

  final UserService _userService;
  final SystemUserBoxService _systemUserBoxService;

  void _onFetchProfileEvent(
    FetchProfileEvent event,
    Emitter<FetchProfileState> emitter,
  ) async {
    try {
      await event.when(
        fetchLocalProfile: () async {
          final localUser = _systemUserBoxService.currentSystemUser;
          if (localUser != null) {
            emitter(FetchProfileSuccessState(user: localUser));
          } else {
            emitter(
              const FetchProfileErrorState(message: 'No local profile found'),
            );
          }
        },
        fetchRemoteProfile: () async {
          emitter(const FetchProfileLoadingState());
          final profile = await _userService.getProfile();

          final userEntity = SystemUserEntity(
            userId: profile.id,
            email: profile.email,
            firstName: profile.profile?.firstName ?? '',
            lastName: profile.profile?.lastName ?? '',
            accountType: profile.accountType,
            role: profile.role,
            status: profile.status,
            createdAt: profile.createdAt?.toIso8601String() ?? '',
            profileImageUrl: profile.profile?.profileImageUrl,
            bio: profile.profile?.bio ?? '',
          );

          _systemUserBoxService.put(userEntity);
          emitter(FetchProfileSuccessState(user: userEntity));
        },
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        emitter(const FetchProfileUnauthorizedState());
      } else {
        emitter(FetchProfileErrorState(message: e.toString()));
      }
    } catch (e) {
      emitter(FetchProfileErrorState(message: e.toString()));
    }
  }
}
