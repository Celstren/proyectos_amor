import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_detail_content.dart';

@RoutePage(name: 'DonationDetailPageRoute')
class DonationDetailPage extends StatelessWidget {
  const DonationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonationDetailContent();
  }
}
