class RegisterRequest {
  final String email;
  final String password;
  final String accountType;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.accountType,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'accountType': accountType,
  };
}
