class DonationResponse {
  final String id;
  final String userId;
  final String donationType;
  final String description;
  final int? quantity;
  final String? amount;
  final String? currency;
  final bool needsCertification;
  final String? attachmentsUrl;
  final String status;
  final DateTime donatedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  DonationResponse({
    required this.id,
    required this.userId,
    required this.donationType,
    required this.description,
    required this.needsCertification,
    required this.status,
    required this.donatedAt,
    required this.createdAt,
    required this.updatedAt,
    this.quantity,
    this.amount,
    this.currency,
    this.attachmentsUrl,
  });

  factory DonationResponse.fromJson(Map<String, dynamic> json) =>
      DonationResponse(
        id: json['id'] as String,
        userId: json['userId'] as String,
        donationType: json['donationType'] as String,
        description: json['description'] as String,
        quantity: json['quantity'] as int?,
        amount: json['amount'] as String?,
        currency: json['currency'] as String?,
        needsCertification: json['needsCertification'] as bool,
        attachmentsUrl: json['attachmentsUrl'] as String?,
        status: json['status'] as String,
        donatedAt: DateTime.parse(json['donatedAt'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
}
