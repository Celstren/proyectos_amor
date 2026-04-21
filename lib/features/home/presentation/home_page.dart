import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donation_campaigns/logic/bloc/donation_campaigns_bloc/donation_campaigns_bloc.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_content.dart';
import 'package:proyectos_amor/injection.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/list_donation_campaigns_request.dart';

@RoutePage(name: 'HomePageRoute')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DonationCampaignsBloc>(
      create: (_) => getIt<DonationCampaignsBloc>()
        ..add(
          const DonationCampaignsEvent.fetchDonationCampaigns(
            request: ListDonationCampaignsRequest(
              status: DonationCampaignStatusFilter.active,
            ),
          ),
        ),
      child: const HomeContent(),
    );
  }
}
