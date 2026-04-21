enum DonationDateFilter {
  today('today'),
  yesterday('yesterday');

  const DonationDateFilter(this.value);

  final String value;
}

enum DonationStatusFilter {
  pending('pending'),
  received('received'),
  cancelled('cancelled');

  const DonationStatusFilter(this.value);

  final String value;
}

class ListDonationsRequest {
  final int page;
  final int limit;
  final DonationDateFilter? dateFilter;
  final DonationStatusFilter? status;

  const ListDonationsRequest({
    this.page = 1,
    this.limit = 10,
    this.dateFilter,
    this.status,
  });

  ListDonationsRequest copyWith({
    int? page,
    int? limit,
    DonationDateFilter? dateFilter,
    DonationStatusFilter? status,
  }) =>
      ListDonationsRequest(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        dateFilter: dateFilter ?? this.dateFilter,
        status: status ?? this.status,
      );

  Map<String, String> toQueryParams() => {
        'page': page.toString(),
        'limit': limit.toString(),
        if (dateFilter != null) 'dateFilter': dateFilter!.value,
        if (status != null) 'status': status!.value,
      };
}
