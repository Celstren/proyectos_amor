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
  final String? certificationRuc;
  final String? certificationCompanyName;
  final String? collectionCenterId;
  final DateTime? pickupAt;
  final String? attachmentsUrl;
  final List<DonationVoucherRequest> vouchers;

  CreateDonationRequest({
    required this.donationType,
    required this.description,
    this.quantity,
    this.amount,
    this.currency,
    this.needsCertification,
    this.certificationRuc,
    this.certificationCompanyName,
    this.collectionCenterId,
    this.pickupAt,
    this.attachmentsUrl,
    this.vouchers = const [],
  });

  CreateDonationRequest copyWithVouchers(List<DonationVoucherRequest> value) {
    return CreateDonationRequest(
      donationType: donationType,
      description: description,
      quantity: quantity,
      amount: amount,
      currency: currency,
      needsCertification: needsCertification,
      certificationRuc: certificationRuc,
      certificationCompanyName: certificationCompanyName,
      collectionCenterId: collectionCenterId,
      pickupAt: pickupAt,
      attachmentsUrl: attachmentsUrl,
      vouchers: value,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'donationType': donationType.name,
      'description': description,
      if (quantity != null) 'quantity': quantity,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (needsCertification != null) 'needsCertification': needsCertification,
      if (certificationRuc != null) 'certificationRuc': certificationRuc,
      if (certificationCompanyName != null)
        'certificationCompanyName': certificationCompanyName,
      if (collectionCenterId != null) 'collectionCenterId': collectionCenterId,
      if (pickupAt != null) 'pickupAt': pickupAt!.toIso8601String(),
      if (attachmentsUrl != null) 'attachmentsUrl': attachmentsUrl,
      if (vouchers.isNotEmpty)
        'vouchers': vouchers.map((voucher) => voucher.toJson()).toList(),
    };
  }
}

class DonationVoucherRequest {
  final String fileUrl;
  final String? fileName;
  final String? fileType;
  final String? mimeType;
  final int? fileSize;
  final String? storageKey;

  DonationVoucherRequest({
    required this.fileUrl,
    this.fileName,
    this.fileType,
    this.mimeType,
    this.fileSize,
    this.storageKey,
  });

  Map<String, dynamic> toJson() {
    return {
      'fileUrl': fileUrl,
      if (fileName != null) 'fileName': fileName,
      if (fileType != null) 'fileType': fileType,
      if (mimeType != null) 'mimeType': mimeType,
      if (fileSize != null) 'fileSize': fileSize,
      if (storageKey != null) 'storageKey': storageKey,
    };
  }
}
