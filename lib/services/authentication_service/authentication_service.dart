import 'package:injectable/injectable.dart';
import 'package:proyectos_amor/services/authentication_service/authentication_repository.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/login_request.dart';
import 'package:proyectos_amor/services/authentication_service/models/request/register_request.dart';

@injectable
class AuthenticationService {
  final IAuthenticationRepository _repository;

  AuthenticationService(this._repository);

  Future<void> register({ required RegisterRequest request }) => _repository.register(request: request);
  Future<void> login({ required LoginRequest request }) => _repository.login(request: request);
}
