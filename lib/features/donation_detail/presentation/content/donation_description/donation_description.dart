import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donation_detail/donation_detail_string.dart';

class DonationDescription extends StatelessWidget {
  final String donation;
  final String receivedBy;
  final bool location;
  final String locationPhone;
  const DonationDescription({
    super.key,
    this.donation = '',
    this.receivedBy = '',
    this.location = true,
    this.locationPhone = '',
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppText.semiBold(
            donation,
            fontSize: 16,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          if (receivedBy.isNotEmpty)
            ...[
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const AppText.normal(
                    DonationDetailStrings.donationDescriptionReceivedBy,
                    fontSize: 12,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                  AppText.normal(
                    receivedBy,
                    fontSize: 12,
                    fontColor: ColorsConstant.splashPrimaryFontColor,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          if (location)
            ...[
              const SizedBox(height: 12),
              const AppText.normal(
                DonationDetailStrings.donationDescriptionLocationTitle,
                fontSize: 12,
                fontColor: ColorsConstant.textPlaceholder,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const SizedBox(
                  height: 160,
                  child: Placeholder(),
                ),
              ),
              const SizedBox(height: 12),
              const AppText.normal(
                'Avenida Manuel Cipriano Dulando 1152 - Altura del parque Benavides ',
                fontSize: 12,
                fontColor: ColorsConstant.splashPrimaryFontColor,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    DonationDetailStrings.donationDescriptionSchedule,
                    fontSize: 12,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                  AppText.normal(
                    '08:00 - 21:00',
                    fontSize: 12,
                    fontColor: ColorsConstant.splashPrimaryFontColor,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText.normal(
                    DonationDetailStrings.donationDescriptionDeliveryDate,
                    fontSize: 12,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                  AppText.normal(
                    '03/May/2024',
                    fontSize: 12,
                    fontColor: ColorsConstant.splashPrimaryFontColor,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          const SizedBox(height: 12),
          const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppText.normal(
                DonationDetailStrings.donationDescriptionLocationPhoneTag,
                fontSize: 12,
                fontColor: ColorsConstant.textPlaceholder,
                textAlign: TextAlign.center,
              ),
              AppText.semiBold(
                '+51 999 600 600',
                fontSize: 12,
                fontColor: ColorsConstant.textLink,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
