import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/achievement_service/achievement_repository.dart';
import 'package:proyectos_amor/services/achievement_service/models/achievement_response.dart';
import 'package:proyectos_amor/services/achievement_service/models/create_achievement_request.dart';
import 'package:proyectos_amor/services/achievement_service/models/list_achievements_request.dart';

@injectable
class AchievementService {
  final IAchievementRepository _repository;

  AchievementService(this._repository);

  Future<List<AchievementResponse>> getAchievements({
    ListAchievementsRequest request = const ListAchievementsRequest(),
  }) =>
      _repository.getAchievements(request: request);

  Future<AchievementResponse> createAchievement(
    CreateAchievementRequest request,
  ) =>
      _repository.createAchievement(request);
}
