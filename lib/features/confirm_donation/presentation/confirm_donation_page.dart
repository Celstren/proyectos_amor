import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_content.dart';

@RoutePage(name: 'ConfirmDonationPageRoute')
class ConfirmDonationPage extends StatelessWidget {
  const ConfirmDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConfirmDonationContent();
  }
}
