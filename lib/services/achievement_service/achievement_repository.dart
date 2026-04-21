import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/achievement_service/models/achievement_response.dart';
import 'package:proyectos_amor/services/achievement_service/models/create_achievement_request.dart';
import 'package:proyectos_amor/services/achievement_service/models/list_achievements_request.dart';

abstract class IAchievementRepository {
  Future<List<AchievementResponse>> getAchievements({
    ListAchievementsRequest request,
  });

  Future<AchievementResponse> createAchievement(
    CreateAchievementRequest request,
  );
}

@LazySingleton(as: IAchievementRepository)
class AchievementRepository implements IAchievementRepository {
  final DioClient _dioClient;

  AchievementRepository(this._dioClient);

  @override
  Future<List<AchievementResponse>> getAchievements({
    ListAchievementsRequest request = const ListAchievementsRequest(),
  }) async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/achievements',
      queryParams: request.toQueryParams(),
      applyToken: false,
    );
    final achievements = response.data as List<dynamic>;

    return achievements
        .map(
          (achievement) => AchievementResponse.fromJson(
            achievement as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  @override
  Future<AchievementResponse> createAchievement(
    CreateAchievementRequest request,
  ) async {
    final response = await _dioClient.post(
      '${AppConstants.baseURL}/achievements',
      body: request.toJson(),
    );

    return AchievementResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
