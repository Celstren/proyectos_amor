import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_content.dart';

@RoutePage(name: 'ConfirmDonationPageRoute')
class ConfirmDonationPage extends StatelessWidget {
  final String donation;
  final String approvedAt;
  final String location;
  final String deliveryAt;
  const ConfirmDonationPage({
    super.key,
    this.donation = '',
    this.approvedAt = '',
    this.location = '',
    this.deliveryAt = '',
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmDonationContent(
      donation: donation,
      approvedAt: approvedAt,
      location: location,
      deliveryAt: deliveryAt,
    );
  }
}
