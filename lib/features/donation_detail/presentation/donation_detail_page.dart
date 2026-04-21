import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donation_detail/logic/bloc/fetch_donation_detail_bloc/fetch_donation_detail_bloc.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_detail_content.dart';
import 'package:proyectos_amor/injection.dart';

@RoutePage(name: 'DonationDetailPageRoute')
class DonationDetailPage extends StatelessWidget {
  final String donationId;

  const DonationDetailPage({
    super.key,
    required this.donationId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FetchDonationDetailBloc>(
      create: (_) => getIt<FetchDonationDetailBloc>(),
      child: DonationDetailContent(donationId: donationId),
    );
  }
}
