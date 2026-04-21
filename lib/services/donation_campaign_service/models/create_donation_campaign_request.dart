enum DonationCampaignType {
  money('money'),
  gift('gift');

  const DonationCampaignType(this.value);

  final String value;
}

enum DonationGiftCategory {
  clothing('clothing'),
  toys('toys'),
  food('food'),
  other('other');

  const DonationGiftCategory(this.value);

  final String value;
}

enum DonationCampaignStatus {
  draft('draft'),
  active('active'),
  completed('completed'),
  cancelled('cancelled');

  const DonationCampaignStatus(this.value);

  final String value;
}

class CreateDonationCampaignRequest {
  final String title;
  final String description;
  final String? imageUrl;
  final DonationCampaignType donationType;
  final DonationGiftCategory? giftCategory;
  final double? goalAmount;
  final double? currentAmount;
  final int? goalQuantity;
  final int? currentQuantity;
  final String currency;
  final DonationCampaignStatus? status;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int? sortOrder;
  final bool? isFeatured;

  const CreateDonationCampaignRequest({
    required this.title,
    required this.description,
    required this.donationType,
    this.imageUrl,
    this.giftCategory,
    this.goalAmount,
    this.currentAmount,
    this.goalQuantity,
    this.currentQuantity,
    this.currency = 'PEN',
    this.status,
    this.startsAt,
    this.endsAt,
    this.sortOrder,
    this.isFeatured,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        if (imageUrl?.isNotEmpty == true) 'imageUrl': imageUrl,
        'donationType': donationType.value,
        if (giftCategory != null) 'giftCategory': giftCategory!.value,
        if (goalAmount != null) 'goalAmount': goalAmount,
        if (currentAmount != null) 'currentAmount': currentAmount,
        if (goalQuantity != null) 'goalQuantity': goalQuantity,
        if (currentQuantity != null) 'currentQuantity': currentQuantity,
        'currency': currency,
        if (status != null) 'status': status!.value,
        if (startsAt != null) 'startsAt': startsAt!.toIso8601String(),
        if (endsAt != null) 'endsAt': endsAt!.toIso8601String(),
        if (sortOrder != null) 'sortOrder': sortOrder,
        if (isFeatured != null) 'isFeatured': isFeatured,
      };
}
