import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_sentry.dart';
import 'package:proyectos_amor/networking/app_api_error.dart';
import 'package:proyectos_amor/services/achievement_service/achievement_service.dart';
import 'package:proyectos_amor/services/achievement_service/models/achievement_response.dart';
import 'package:proyectos_amor/services/achievement_service/models/create_achievement_request.dart';
import 'package:proyectos_amor/services/achievement_service/models/list_achievements_request.dart';

part 'achievements_bloc.freezed.dart';

@freezed
class AchievementsEvent with _$AchievementsEvent {
  /// Loads achievements using optional backend filters.
  const factory AchievementsEvent.fetchAchievements({
    @Default(ListAchievementsRequest()) ListAchievementsRequest request,
  }) = FetchAchievements;

  /// Reloads achievements using the latest applied filters.
  const factory AchievementsEvent.refreshAchievements() = RefreshAchievements;

  /// Creates a new achievement definition. This endpoint is restricted to admins.
  const factory AchievementsEvent.createAchievement({
    required CreateAchievementRequest request,
  }) = CreateAchievement;
}

@freezed
class AchievementsState with _$AchievementsState {
  const factory AchievementsState.achievementsUninitializedState() =
      AchievementsUninitializedState;
  const factory AchievementsState.achievementsLoadingState() =
      AchievementsLoadingState;
  const factory AchievementsState.achievementsSuccessState({
    required List<AchievementResponse> achievements,
    required ListAchievementsRequest request,
  }) = AchievementsSuccessState;
  const factory AchievementsState.createAchievementLoadingState() =
      CreateAchievementLoadingState;
  const factory AchievementsState.createAchievementSuccessState({
    required AchievementResponse achievement,
  }) = CreateAchievementSuccessState;
  const factory AchievementsState.achievementsErrorState({
    @Default('') String message,
    String? errorCode,
    int? statusCode,
  }) = AchievementsErrorState;
}

/// [AchievementsBloc] manages achievement definition flows.
///
/// It keeps achievement screens decoupled from the API layer by:
/// 1. Loading active or filtered achievements.
/// 2. Refreshing the latest filter set.
/// 3. Creating admin-only achievement definitions.
/// 4. Reporting API failures to Sentry while exposing friendly UI states.
@injectable
class AchievementsBloc extends Bloc<AchievementsEvent, AchievementsState> {
  AchievementsBloc(this._achievementService)
      : super(const AchievementsUninitializedState()) {
    on<AchievementsEvent>(_onAchievementsEvent);
  }

  final AchievementService _achievementService;
  ListAchievementsRequest _currentRequest = const ListAchievementsRequest();

  void _onAchievementsEvent(
    AchievementsEvent event,
    Emitter<AchievementsState> emitter,
  ) async {
    try {
      await event.when(
        fetchAchievements: (request) async {
          _currentRequest = request;
          emitter(const AchievementsLoadingState());
          final achievements = await _achievementService.getAchievements(
            request: request,
          );
          emitter(
            AchievementsSuccessState(
              achievements: achievements,
              request: request,
            ),
          );
        },
        refreshAchievements: () async {
          emitter(const AchievementsLoadingState());
          final achievements = await _achievementService.getAchievements(
            request: _currentRequest,
          );
          emitter(
            AchievementsSuccessState(
              achievements: achievements,
              request: _currentRequest,
            ),
          );
        },
        createAchievement: (request) async {
          emitter(const CreateAchievementLoadingState());
          final achievement =
              await _achievementService.createAchievement(request);
          emitter(CreateAchievementSuccessState(achievement: achievement));
        },
      );
    } catch (e, stackTrace) {
      final error = AppApiError.fromException(e);
      await AppSentry.captureApiError(
        error: error,
        exception: e,
        stackTrace: stackTrace,
        feature: 'achievements',
        operation: _operationNameFor(event),
      );
      emitter(
        AchievementsErrorState(
          message: error.displayMessage,
          errorCode: error.errorCode,
          statusCode: error.statusCode,
        ),
      );
    }
  }

  String _operationNameFor(AchievementsEvent event) => event.when(
        fetchAchievements: (_) => 'fetchAchievements',
        refreshAchievements: () => 'refreshAchievements',
        createAchievement: (_) => 'createAchievement',
      );
}
