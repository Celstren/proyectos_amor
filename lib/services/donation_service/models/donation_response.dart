class DonationResponse {
  final String id;
  final String userId;
  final String donationType;
  final String description;
  final int? quantity;
  final String? amount;
  final String? currency;
  final bool needsCertification;
  final String? certificationRuc;
  final String? certificationCompanyName;
  final String? collectionCenterId;
  final DonationCollectionCenterResponse? collectionCenter;
  final DateTime? pickupAt;
  final String? attachmentsUrl;
  final List<DonationVoucherResponse> vouchers;
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
    this.certificationRuc,
    this.certificationCompanyName,
    this.collectionCenterId,
    this.collectionCenter,
    this.pickupAt,
    this.vouchers = const [],
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
        certificationRuc: json['certificationRuc'] as String?,
        certificationCompanyName: json['certificationCompanyName'] as String?,
        collectionCenterId: json['collectionCenterId'] as String?,
        collectionCenter: json['collectionCenter'] == null
            ? null
            : DonationCollectionCenterResponse.fromJson(
                json['collectionCenter'] as Map<String, dynamic>,
              ),
        pickupAt: json['pickupAt'] == null
            ? null
            : DateTime.parse(json['pickupAt'] as String),
        attachmentsUrl: json['attachmentsUrl'] as String?,
        vouchers: (json['vouchers'] as List<dynamic>? ?? [])
            .map(
              (voucher) => DonationVoucherResponse.fromJson(
                voucher as Map<String, dynamic>,
              ),
            )
            .toList(),
        status: json['status'] as String,
        donatedAt: DateTime.parse(json['donatedAt'] as String),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
}

class DonationCollectionCenterResponse {
  final String id;
  final String alias;
  final String address;
  final String? latitude;
  final String? longitude;

  DonationCollectionCenterResponse({
    required this.id,
    required this.alias,
    required this.address,
    this.latitude,
    this.longitude,
  });

  factory DonationCollectionCenterResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      DonationCollectionCenterResponse(
        id: json['id'] as String,
        alias: json['alias'] as String,
        address: json['address'] as String,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
      );
}

class DonationVoucherResponse {
  final String id;
  final String donationId;
  final String fileUrl;
  final String? fileName;
  final String? fileType;
  final String? mimeType;
  final int? fileSize;
  final String? storageKey;
  final DateTime createdAt;

  DonationVoucherResponse({
    required this.id,
    required this.donationId,
    required this.fileUrl,
    required this.createdAt,
    this.fileName,
    this.fileType,
    this.mimeType,
    this.fileSize,
    this.storageKey,
  });

  factory DonationVoucherResponse.fromJson(Map<String, dynamic> json) =>
      DonationVoucherResponse(
        id: json['id'] as String,
        donationId: json['donationId'] as String,
        fileUrl: json['fileUrl'] as String,
        fileName: json['fileName'] as String?,
        fileType: json['fileType'] as String?,
        mimeType: json['mimeType'] as String?,
        fileSize: json['fileSize'] as int?,
        storageKey: json['storageKey'] as String?,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );
}
