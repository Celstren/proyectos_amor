import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_drop_down/app_drop_down.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/donations/logic/bloc/list_donations_bloc/list_donations_bloc.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_empty.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_group.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_item.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';
import 'package:proyectos_amor/services/donation_service/models/donation_response.dart';
import 'package:proyectos_amor/services/donation_service/models/list_donations_request.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AuthenticatedDonationContent extends StatelessWidget {
  const AuthenticatedDonationContent({super.key});

  @override
  Widget build(BuildContext context) =>
      const _AuthenticatedDonationContentView();
}

class _AuthenticatedDonationContentView extends StatefulWidget {
  const _AuthenticatedDonationContentView();

  @override
  State<_AuthenticatedDonationContentView> createState() =>
      _AuthenticatedDonationContentViewState();
}

class _AuthenticatedDonationContentViewState
    extends State<_AuthenticatedDonationContentView> {
  static const _pageSize = 10;

  final _dateOptions = <AppDropDownOption>[
    AppDropDownOption(id: 1, value: 'Todas'),
    AppDropDownOption(id: 2, value: 'Hoy'),
    AppDropDownOption(id: 3, value: 'Ayer'),
  ];
  final _statusOptions = <AppDropDownOption>[
    AppDropDownOption(id: 1, value: 'Todos'),
    AppDropDownOption(id: 2, value: 'Pendiente'),
    AppDropDownOption(id: 3, value: 'Recibido'),
    AppDropDownOption(id: 4, value: 'Cancelado'),
  ];

  AppDropDownOption? _selectedDateOption;
  AppDropDownOption? _selectedStatusOption;

  @override
  void initState() {
    super.initState();
    _selectedDateOption = _dateOptions.first;
    _selectedStatusOption = _statusOptions.first;
    _fetchDonations();
  }

  void _fetchDonations() {
    context.read<ListDonationsBloc>().add(
          ListDonationsEvent.fetchDonations(request: _buildRequest()),
        );
  }

  ListDonationsRequest _buildRequest({int page = 1}) => ListDonationsRequest(
        page: page,
        limit: _pageSize,
        dateFilter: _dateFilterFromOption(_selectedDateOption),
        status: _statusFilterFromOption(_selectedStatusOption),
      );

  DonationDateFilter? _dateFilterFromOption(AppDropDownOption? option) {
    switch (option?.id) {
      case 2:
        return DonationDateFilter.today;
      case 3:
        return DonationDateFilter.yesterday;
      default:
        return null;
    }
  }

  DonationStatusFilter? _statusFilterFromOption(AppDropDownOption? option) {
    switch (option?.id) {
      case 2:
        return DonationStatusFilter.pending;
      case 3:
        return DonationStatusFilter.received;
      case 4:
        return DonationStatusFilter.cancelled;
      default:
        return null;
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification.metrics.pixels >=
        notification.metrics.maxScrollExtent - 120) {
      context
          .read<ListDonationsBloc>()
          .add(const ListDonationsEvent.fetchNextPage());
    }
    return false;
  }

  Map<String, List<DonationResponse>> _groupDonationsByDate(
    List<DonationResponse> donations,
  ) {
    final groupedDonations = <String, List<DonationResponse>>{};
    for (final donation in donations) {
      final title = _formatGroupTitle(donation.donatedAt);
      groupedDonations.putIfAbsent(title, () => []).add(donation);
    }
    return groupedDonations;
  }

  String _formatGroupTitle(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final donationDate = DateTime(date.year, date.month, date.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (donationDate == today) return 'Hoy';
    if (donationDate == yesterday) return 'Ayer';
    return DateFormat('dd MMM yyyy', 'es_MX').format(date);
  }

  String _donationText(DonationResponse donation) {
    if (donation.donationType == 'money') {
      final currency = donation.currency ?? '';
      final amount = donation.amount ?? '0.00';
      return 'dinero - $currency $amount'.trim();
    }

    final quantity = donation.quantity ?? 0;
    return '$quantity ${donation.description}';
  }

  DonationStatus _donationStatus(String status) {
    switch (status) {
      case 'received':
        return DonationStatus.received;
      case 'cancelled':
        return DonationStatus.cancelled;
      case 'pending':
      default:
        return DonationStatus.pending;
    }
  }

  Widget _buildFilters() {
    return Column(
      children: [
        AppDropDown(
          options: _dateOptions,
          optionSelected: _selectedDateOption,
          onChanged: (option) {
            setState(() => _selectedDateOption = option);
            _fetchDonations();
          },
          hint: ProfileStrings.authenticatedDonationContentHint,
        ),
        const SizedBox(height: 12),
        AppDropDown(
          options: _statusOptions,
          optionSelected: _selectedStatusOption,
          onChanged: (option) {
            setState(() => _selectedStatusOption = option);
            _fetchDonations();
          },
          hint: 'Estado',
        ),
      ],
    );
  }

  Widget _buildDonationGroups(List<DonationResponse> donations) {
    if (donations.isEmpty) {
      return const AuthenticatedDonationEmpty();
    }

    final groupedDonations = _groupDonationsByDate(donations);
    return Column(
      children: groupedDonations.entries
          .map(
            (entry) => AuthenticatedDonationGroup(
              title: entry.key,
              items: entry.value
                  .map(
                    (donation) => AuthenticatedDonationItem(
                      donationId: donation.id,
                      text: _donationText(donation),
                      status: _donationStatus(donation.status),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotification,
      child: RefreshIndicator(
        onRefresh: () async {
          context
              .read<ListDonationsBloc>()
              .add(const ListDonationsEvent.refreshDonations());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24),
              const AppText.semiBold(
                ProfileStrings.authenticatedDonationContentTitle,
                fontColor: ColorsConstant.textPlaceholder,
                fontSize: 14,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              _buildFilters(),
              BlocBuilder<ListDonationsBloc, ListDonationsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    listDonationsLoadingState: () =>
                        const _DonationListSkeleton(),
                    listDonationsSuccessState:
                        (donations, meta, request, isLoadingMore) => Column(
                      children: [
                        _buildDonationGroups(donations),
                        if (isLoadingMore) const _DonationLoadMoreSkeleton(),
                      ],
                    ),
                    listDonationsErrorState: (message) => Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: AppText.normal(
                        message,
                        fontColor: Colors.red,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _DonationListSkeleton extends StatelessWidget {
  const _DonationListSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: IgnorePointer(
        child: Column(
          children: [
            AuthenticatedDonationGroup(
              title: 'Hoy',
              items: [
                AuthenticatedDonationItem(
                  text: 'dinero - PEN 50.00',
                  status: DonationStatus.pending,
                ),
                AuthenticatedDonationItem(
                  text: '2 juguetes educativos',
                  status: DonationStatus.received,
                ),
              ],
            ),
            AuthenticatedDonationGroup(
              title: 'Ayer',
              items: [
                AuthenticatedDonationItem(
                  text: '1 caja de ropa para niños',
                  status: DonationStatus.pending,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DonationLoadMoreSkeleton extends StatelessWidget {
  const _DonationLoadMoreSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Skeletonizer(
        enabled: true,
        child: IgnorePointer(
          child: AuthenticatedDonationGroup(
            title: 'Más donaciones',
            items: [
              AuthenticatedDonationItem(
                text: 'dinero - PEN 25.00',
                status: DonationStatus.pending,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
