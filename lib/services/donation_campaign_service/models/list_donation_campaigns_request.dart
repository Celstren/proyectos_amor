enum DonationCampaignTypeFilter {
  money('money'),
  gift('gift');

  const DonationCampaignTypeFilter(this.value);

  final String value;
}

enum DonationCampaignStatusFilter {
  draft('draft'),
  active('active'),
  completed('completed'),
  cancelled('cancelled');

  const DonationCampaignStatusFilter(this.value);

  final String value;
}

class ListDonationCampaignsRequest {
  final DonationCampaignStatusFilter? status;
  final DonationCampaignTypeFilter? donationType;
  final bool? isFeatured;

  const ListDonationCampaignsRequest({
    this.status,
    this.donationType,
    this.isFeatured,
  });

  Map<String, String> toQueryParams() => {
        if (status != null) 'status': status!.value,
        if (donationType != null) 'donationType': donationType!.value,
        if (isFeatured != null) 'isFeatured': isFeatured.toString(),
      };
}
