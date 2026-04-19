class UpdateProfileRequest {
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? countryCode;
  final String? country;
  final String? headline;
  final String? bio;
  final String? joinedAt;
  final String? profileImageUrl;

  UpdateProfileRequest({
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

  Map<String, dynamic> toJson() {
    return {
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (phone != null) 'phone': phone,
      if (countryCode != null) 'country_code': countryCode,
      if (country != null) 'country': country,
      if (headline != null) 'headline': headline,
      if (bio != null) 'bio': bio,
      if (joinedAt != null) 'joined_at': joinedAt,
      if (profileImageUrl != null) 'profile_image_url': profileImageUrl,
    };
  }
}
