class CollectionCenterResponse {
  final String id;
  final String alias;
  final String address;
  final String latitude;
  final String longitude;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  CollectionCenterResponse({
    required this.id,
    required this.alias,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CollectionCenterResponse.fromJson(Map<String, dynamic> json) =>
      CollectionCenterResponse(
        id: json['id'] as String,
        alias: json['alias'] as String,
        address: json['address'] as String,
        latitude: json['latitude'].toString(),
        longitude: json['longitude'].toString(),
        isActive: json['isActive'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
}
