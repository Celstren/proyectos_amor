enum AchievementRuleType {
  firstDayDonation('first_day_donation'),
  donationQuantityByGiftCategory('donation_quantity_by_gift_category'),
  donationAtCollectionCenter('donation_at_collection_center'),
  donationAtAllCollectionCenters('donation_at_all_collection_centers'),
  moneyDonationAmount('money_donation_amount'),
  donationCount('donation_count'),
  custom('custom');

  const AchievementRuleType(this.value);

  final String value;
}

enum AchievementStatus {
  active('active'),
  inactive('inactive');

  const AchievementStatus(this.value);

  final String value;
}

class CreateAchievementRequest {
  final String code;
  final String title;
  final String? description;
  final String? iconUrl;
  final AchievementRuleType ruleType;
  final Map<String, dynamic> ruleConfig;
  final int? points;
  final AchievementStatus? status;
  final int? sortOrder;

  const CreateAchievementRequest({
    required this.code,
    required this.title,
    required this.ruleType,
    this.description,
    this.iconUrl,
    this.ruleConfig = const {},
    this.points,
    this.status,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'title': title,
        if (description?.isNotEmpty == true) 'description': description,
        if (iconUrl?.isNotEmpty == true) 'iconUrl': iconUrl,
        'ruleType': ruleType.value,
        'ruleConfig': ruleConfig,
        if (points != null) 'points': points,
        if (status != null) 'status': status!.value,
        if (sortOrder != null) 'sortOrder': sortOrder,
      };
}
