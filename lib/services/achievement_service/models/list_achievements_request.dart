enum AchievementRuleTypeFilter {
  firstDayDonation('first_day_donation'),
  donationQuantityByGiftCategory('donation_quantity_by_gift_category'),
  donationAtCollectionCenter('donation_at_collection_center'),
  donationAtAllCollectionCenters('donation_at_all_collection_centers'),
  moneyDonationAmount('money_donation_amount'),
  donationCount('donation_count'),
  custom('custom');

  const AchievementRuleTypeFilter(this.value);

  final String value;
}

enum AchievementStatusFilter {
  active('active'),
  inactive('inactive');

  const AchievementStatusFilter(this.value);

  final String value;
}

class ListAchievementsRequest {
  final AchievementStatusFilter? status;
  final AchievementRuleTypeFilter? ruleType;

  const ListAchievementsRequest({
    this.status,
    this.ruleType,
  });

  Map<String, String> toQueryParams() => {
        if (status != null) 'status': status!.value,
        if (ruleType != null) 'ruleType': ruleType!.value,
      };
}
