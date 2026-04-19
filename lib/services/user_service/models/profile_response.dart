class ProfileResponse {
  final String id;
  final String email;
  final String? accountType;
  final String? role;
  final String? status;
  final DateTime? createdAt;
  final UserProfile? profile;

  ProfileResponse({
    required this.id,
    required this.email,
    this.accountType,
    this.role,
    this.status,
    this.createdAt,
    this.profile,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
        id: json['id'] as String,
        email: json['email'] as String,
        accountType: json['accountType'] as String?,
        role: json['role'] as String?,
        status: json['status'] as String?,
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null,
        profile: json['profile'] != null ? UserProfile.fromJson(json['profile'] as Map<String, dynamic>) : null,
      );
}

class UserProfile {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? countryCode;
  final String? country;
  final String? headline;
  final String? bio;
  final String? joinedAt;
  final String? profileImageUrl;

  UserProfile({
    this.firstName,
    this.lastName,
    this.phone,
    this.countryCode,
    this.country,
    this.headline,
    this.bio,
    this.joinedAt,
    this.profileImageUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        phone: json['phone'] as String?,
        countryCode: json['countryCode'] as String?,
        country: json['country'] as String?,
        headline: json['headline'] as String?,
        bio: json['bio'] as String?,
        joinedAt: json['joinedAt'] as String?,
        profileImageUrl: json['profileImageUrl'] as String?,
      );
}
