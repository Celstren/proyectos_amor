import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donation_detail/donation_detail_string.dart';

class DonationDescription extends StatelessWidget {
  final String donation;
  final String receivedBy;
  final String locationAddress;
  final String deliveryDate;
  final String locationPhone;
  const DonationDescription({
    super.key,
    this.donation = '',
    this.receivedBy = '',
    this.locationAddress = '',
    this.deliveryDate = '',
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
          if (receivedBy.isNotEmpty) ...[
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
          if (locationAddress.isNotEmpty) ...[
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
              child: Container(
                height: 160,
                color: ColorsConstant.text050,
                child: const Center(
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 40,
                    color: ColorsConstant.primaryColor600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            AppText.normal(
              locationAddress,
              fontSize: 12,
              fontColor: ColorsConstant.splashPrimaryFontColor,
              textAlign: TextAlign.start,
            ),
          ],
          if (deliveryDate.isNotEmpty) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AppText.normal(
                  DonationDetailStrings.donationDescriptionDeliveryDate,
                  fontSize: 12,
                  fontColor: ColorsConstant.textPlaceholder,
                  textAlign: TextAlign.start,
                ),
                AppText.normal(
                  deliveryDate,
                  fontSize: 12,
                  fontColor: ColorsConstant.splashPrimaryFontColor,
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ],
          if (locationPhone.isNotEmpty) ...[
            const SizedBox(height: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const AppText.normal(
                  DonationDetailStrings.donationDescriptionLocationPhoneTag,
                  fontSize: 12,
                  fontColor: ColorsConstant.textPlaceholder,
                  textAlign: TextAlign.center,
                ),
                AppText.semiBold(
                  locationPhone,
                  fontSize: 12,
                  fontColor: ColorsConstant.textLink,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
