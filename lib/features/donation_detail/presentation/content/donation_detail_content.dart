import 'package:app_ui/app_scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_description/donation_description.dart';
import 'package:proyectos_amor/features/donation_detail/presentation/content/donation_detail_header/donation_detail_header.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_item.dart';

class DonationDetailContent extends StatefulWidget {
  const DonationDetailContent({super.key});

  @override
  State<DonationDetailContent> createState() => _DonationDetailContentState();
}

class _DonationDetailContentState extends State<DonationDetailContent> {


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const DonationDetailHeader(),
            Container(
              height: 208,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/claim_certification/claim_certification_placeholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DonationStatus.pending.card,
              ),
            ),
            DonationDescription(
              donation: '3 muñecas barbie',
              receivedBy: 'Maria Espinoza',
            ),
          ],
        ),
      ),
    );
  }
}
