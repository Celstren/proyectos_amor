import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/user_service/models/profile_response.dart';
import 'package:proyectos_amor/services/user_service/models/update_profile_request.dart';
import 'package:proyectos_amor/services/user_service/user_repository.dart';

@injectable
class UserService {
  final IUserRepository _repository;

  UserService(this._repository);

  Future<ProfileResponse> getProfile() => _repository.getProfile();

  Future<ProfileResponse> updateProfile(UpdateProfileRequest request) =>
      _repository.updateProfile(request);
}
