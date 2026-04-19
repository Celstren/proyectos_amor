enum DonationType {
  money,
  item,
}

class CreateDonationRequest {
  final DonationType donationType;
  final String description;
  final int? quantity;
  final double? amount;
  final String? currency;
  final bool? needsCertification;
  final String? attachmentsUrl;

  CreateDonationRequest({
    required this.donationType,
    required this.description,
    this.quantity,
    this.amount,
    this.currency,
    this.needsCertification,
    this.attachmentsUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'donationType': donationType.name,
      'description': description,
      if (quantity != null) 'quantity': quantity,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (needsCertification != null) 'needsCertification': needsCertification,
      if (attachmentsUrl != null) 'attachmentsUrl': attachmentsUrl,
    };
  }
}
