class AchievementResponse {
  final String id;
  final String code;
  final String title;
  final String? description;
  final String? iconUrl;
  final String ruleType;
  final Map<String, dynamic> ruleConfig;
  final int points;
  final String status;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AchievementResponse({
    required this.id,
    required this.code,
    required this.title,
    required this.ruleType,
    required this.ruleConfig,
    required this.points,
    required this.status,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.iconUrl,
  });

  factory AchievementResponse.fromJson(Map<String, dynamic> json) =>
      AchievementResponse(
        id: json['id'] as String,
        code: json['code'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        iconUrl: json['iconUrl'] as String?,
        ruleType: json['ruleType'] as String,
        ruleConfig: (json['ruleConfig'] as Map?)?.cast<String, dynamic>() ??
            <String, dynamic>{},
        points: json['points'] as int? ?? 0,
        status: json['status'] as String,
        sortOrder: json['sortOrder'] as int? ?? 0,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );
}
