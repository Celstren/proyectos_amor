import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

enum DonationStatus { pending, received, cancelled }

extension DonationStatusExtension on DonationStatus {
  Widget get card {
    switch(this) {
      case DonationStatus.pending:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorsConstant.feedbackWarning200,
          ),
          child: const AppText.semiBold(
            'Pendiente',
            fontSize: 14,
            fontColor: ColorsConstant.feedbackWarning600,
          ),
        );
      case DonationStatus.received:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorsConstant.feedbackSuccess200,
          ),
          child: const AppText.semiBold(
            'Recibido',
            fontSize: 14,
            fontColor: ColorsConstant.feedbackSuccess600,
          ),
        );
      case DonationStatus.cancelled:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorsConstant.feedbackError200,
          ),
          child: const AppText.semiBold(
            'Cancelado',
            fontSize: 14,
            fontColor: ColorsConstant.feedbackError600,
          ),
        );
    }
  }
}

class AuthenticatedDonationItem extends StatelessWidget {
  final String text;
  final DonationStatus status;
  const AuthenticatedDonationItem({
    super.key,
    this.text = '',
    this.status = DonationStatus.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AppText.normal(
          text,
          fontColor: ColorsConstant.splashPrimaryFontColor,
          fontSize: 14,
          textAlign: TextAlign.start,
        ),
        status.card,
      ],
    );
  }
}
