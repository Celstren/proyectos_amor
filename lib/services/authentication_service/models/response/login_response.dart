class AuthenticatedResponse {
  final UserResponse user;
  final String accessToken;
  final String refreshToken;

  AuthenticatedResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthenticatedResponse.fromJson(Map<String, dynamic> json) => AuthenticatedResponse(
        user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );
}

class UserResponse {
  final String id;
  final String email;
  final String role;

  UserResponse({
    required this.id,
    required this.email,
    required this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json['id'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
      );
}
