class DonationCampaignResponse {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final String donationType;
  final String? giftCategory;
  final String? goalAmount;
  final String currentAmount;
  final int? goalQuantity;
  final int currentQuantity;
  final String currency;
  final String status;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int sortOrder;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DonationCampaignResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.donationType,
    required this.currentAmount,
    required this.currentQuantity,
    required this.currency,
    required this.status,
    required this.sortOrder,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
    this.giftCategory,
    this.goalAmount,
    this.goalQuantity,
    this.startsAt,
    this.endsAt,
  });

  factory DonationCampaignResponse.fromJson(Map<String, dynamic> json) =>
      DonationCampaignResponse(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        imageUrl: json['imageUrl'] as String?,
        donationType: json['donationType'] as String,
        giftCategory: json['giftCategory'] as String?,
        goalAmount: json['goalAmount'] as String?,
        currentAmount: json['currentAmount'] as String? ?? '0',
        goalQuantity: json['goalQuantity'] as int?,
        currentQuantity: json['currentQuantity'] as int? ?? 0,
        currency: json['currency'] as String,
        status: json['status'] as String,
        startsAt: json['startsAt'] == null
            ? null
            : DateTime.parse(json['startsAt'] as String),
        endsAt: json['endsAt'] == null
            ? null
            : DateTime.parse(json['endsAt'] as String),
        sortOrder: json['sortOrder'] as int? ?? 0,
        isFeatured: json['isFeatured'] as bool? ?? false,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  bool get isMoneyCampaign => donationType == 'money';
  bool get isGiftCampaign => donationType == 'gift';

  double get progress {
    if (isMoneyCampaign) {
      final current = double.tryParse(currentAmount) ?? 0;
      final goal = double.tryParse(goalAmount ?? '') ?? 0;
      if (goal <= 0) return 0;
      return (current / goal).clamp(0, 1).toDouble();
    }

    final goal = goalQuantity ?? 0;
    if (goal <= 0) return 0;
    return (currentQuantity / goal).clamp(0, 1).toDouble();
  }
}
