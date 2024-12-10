import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/profile/presentation/content/authenticated_profile/authenticated_profile_tabs/authenticated_profile_tabs_content/authenticated_donation_content/authenticated_donation_item.dart';

class AuthenticatedDonationGroup extends StatelessWidget {
  final String title;
  final List<AuthenticatedDonationItem> items;
  const AuthenticatedDonationGroup({
    super.key,
    this.title = '',
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: ColorsConstant.text200,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppText.semiBold(
            title,
            fontSize: 14,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          ...items.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: e,
          )),
        ],
      ),
    );
  }
}
