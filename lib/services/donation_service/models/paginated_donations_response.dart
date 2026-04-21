import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';

class PaginatedDonationsResponse {
  final List<DonationResponse> items;
  final PaginationMeta meta;

  const PaginatedDonationsResponse({
    required this.items,
    required this.meta,
  });

  factory PaginatedDonationsResponse.fromJson(Map<String, dynamic> json) =>
      PaginatedDonationsResponse(
        items: (json['items'] as List<dynamic>? ?? [])
            .map(
              (donation) =>
                  DonationResponse.fromJson(donation as Map<String, dynamic>),
            )
            .toList(),
        meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      );
}

class PaginationMeta {
  final int page;
  final int limit;
  final int total;
  final int totalPages;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationMeta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPages,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) => PaginationMeta(
        page: json['page'] as int,
        limit: json['limit'] as int,
        total: json['total'] as int,
        totalPages: json['totalPages'] as int,
        hasNextPage: json['hasNextPage'] as bool,
        hasPreviousPage: json['hasPreviousPage'] as bool,
      );
}
