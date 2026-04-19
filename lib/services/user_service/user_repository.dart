import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/config/app_constants.dart';
import 'package:proyectos_amor/networking/dio_client.dart';
import 'package:proyectos_amor/services/user_service/models/profile_response.dart';
import 'package:proyectos_amor/services/user_service/models/update_profile_request.dart';

abstract class IUserRepository {
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> updateProfile(UpdateProfileRequest request);
}

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final DioClient _dioClient;

  UserRepository(this._dioClient);

  @override
  Future<ProfileResponse> getProfile() async {
    final response = await _dioClient.get(
      '${AppConstants.baseURL}/users/profile',
    );

    return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ProfileResponse> updateProfile(UpdateProfileRequest request) async {
    final response = await _dioClient.patch(
      '${AppConstants.baseURL}/users/profile',
      body: request.toJson(),
    );

    return ProfileResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
