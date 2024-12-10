import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_drop_down/app_drop_down.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_group.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_item.dart';
import 'package:proyectos_amor/features/profile/profile_strings.dart';

class AuthenticatedDonationContent extends StatelessWidget {
  const AuthenticatedDonationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          AppDropDown(
            options: <AppDropDownOption>[
              AppDropDownOption(id: 1, value: 'Todas'),
              AppDropDownOption(id: 2, value: 'Hoy'),
              AppDropDownOption(id: 3, value: 'Ayer'),
            ],
            onChanged: (p0) {},
            hint: ProfileStrings.authenticatedDonationContentHint,
          ),
          const AuthenticatedDonationGroup(
            title: 'Hoy',
            items: <AuthenticatedDonationItem>[
              AuthenticatedDonationItem(
                text: '3 juguetes barbie',
                status: DonationStatus.pending,
              ),
              AuthenticatedDonationItem(
                text: '1 tren',
                status: DonationStatus.received,
              ),
            ],
          ),
          const AuthenticatedDonationGroup(
            title: 'Ayer',
            items: <AuthenticatedDonationItem>[
              AuthenticatedDonationItem(
                text: 'dinero - S/ 1,000.00',
                status: DonationStatus.cancelled,
              ),
              AuthenticatedDonationItem(
                text: '1 tren',
                status: DonationStatus.cancelled,
              ),
              AuthenticatedDonationItem(
                text: '1 tren',
                status: DonationStatus.cancelled,
              ),
            ],
          ),
          const AuthenticatedDonationGroup(
            title: '10 Ene 2024',
            items: <AuthenticatedDonationItem>[
              AuthenticatedDonationItem(
                text: '3 juguetes barbie',
                status: DonationStatus.pending,
              ),
              AuthenticatedDonationItem(
                text: '1 tren',
                status: DonationStatus.received,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
