import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_bottom/confirm_donation_bottom.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_card/confirm_donation_card.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_description/confirm_donation_description.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_header/confirm_donation_header.dart';
import 'package:proyectos_amor/features/confirm_donation/presentation/content/confirm_donation_image/confirm_donation_image.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_certification/home_certification.dart';

class ConfirmDonationContent extends StatefulWidget {
  final String donation;
  final String approvedAt;
  final String location;
  final String deliveryAt;
  const ConfirmDonationContent({
    super.key,
    this.donation = '',
    this.approvedAt = '',
    this.location = '',
    this.deliveryAt = '',
  });

  @override
  State<ConfirmDonationContent> createState() => _ConfirmDonationContentState();
}

class _ConfirmDonationContentState extends State<ConfirmDonationContent> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const ConfirmDonationHeader(),
                  const ConfirmDonationImage(),
                  ConfirmDonationDescription(
                    donation: widget.donation,
                    approvedAt: widget.approvedAt,
                    location: widget.location,
                    deliveryAt: widget.deliveryAt,
                  ),
                  const SizedBox(height: 24),
                  const ConfirmDonationCard(),
                  const SizedBox(height: 24),
                  const HomeCertification(),
                ],
              ),
            ),
          ),
          const ConfirmDonationBottom(),
        ],
      ),
    );
  }
}
