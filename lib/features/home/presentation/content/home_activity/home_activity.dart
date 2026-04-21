import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/donation_campaigns/logic/bloc/donation_campaigns_bloc/donation_campaigns_bloc.dart';
import 'package:proyectos_amor/features/home/home_strings.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_activity/home_activity_card.dart';
import 'package:proyectos_amor/services/donation_campaign_service/models/donation_campaign_response.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationCampaignsBloc, DonationCampaignsState>(
      builder: (context, state) => state.maybeWhen(
        donationCampaignsLoadingState: () => _HomeActivityLayout(
          campaigns: const [],
          currentIndex: 0,
          isLoading: true,
          onPageChanged: _onPageChanged,
        ),
        donationCampaignsSuccessState: (campaigns, request) {
          if (campaigns.isEmpty) return const SizedBox.shrink();

          final visibleCampaigns = campaigns.take(5).toList();
          final safeIndex = _currentIndex >= visibleCampaigns.length
              ? visibleCampaigns.length - 1
              : _currentIndex;

          return _HomeActivityLayout(
            campaigns: visibleCampaigns,
            currentIndex: safeIndex,
            onPageChanged: _onPageChanged,
          );
        },
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }

  void _onPageChanged(int index) {
    if (_currentIndex == index) return;
    setState(() => _currentIndex = index);
  }
}

class _HomeActivityLayout extends StatelessWidget {
  final List<DonationCampaignResponse> campaigns;
  final int currentIndex;
  final bool isLoading;
  final ValueChanged<int> onPageChanged;

  const _HomeActivityLayout({
    required this.campaigns,
    required this.currentIndex,
    required this.onPageChanged,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasMultipleCampaigns = campaigns.length > 1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const AppText.semiBold(
          HomeStrings.homeActivityTitle,
          fontSize: 18,
          fontColor: ColorsConstant.text950,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: SizeConstants.lg),
        if (isLoading)
          const HomeActivityCard.loading()
        else if (hasMultipleCampaigns)
          CarouselSlider.builder(
            itemCount: campaigns.length,
            itemBuilder: (context, index, realIndex) => HomeActivityCard(
              campaign: campaigns[index],
            ),
            options: CarouselOptions(
              height: 405,
              viewportFraction: 1,
              enableInfiniteScroll: campaigns.length > 1,
              enlargeCenterPage: false,
              autoPlay: campaigns.length > 1,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) => onPageChanged(index),
            ),
          )
        else
          HomeActivityCard(campaign: campaigns.first),
        if (hasMultipleCampaigns) ...[
          const SizedBox(height: SizeConstants.md),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              campaigns.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: index != 0 ? const EdgeInsets.only(left: 8) : null,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? ColorsConstant.sliderPrimaryColor
                      : ColorsConstant.sliderSecondaryColor,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
