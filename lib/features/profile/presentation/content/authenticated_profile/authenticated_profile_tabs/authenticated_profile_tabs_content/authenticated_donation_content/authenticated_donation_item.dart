import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

enum DonationStatus { pending, received, cancelled }

extension DonationStatusExtension on DonationStatus {
  Widget get card {
    switch (this) {
      case DonationStatus.pending:
        return const _DonationStatusTag(
          text: 'Pendiente',
          backgroundColor: ColorsConstant.feedbackWarning050,
          borderColor: ColorsConstant.feedbackWarning300,
          textColor: ColorsConstant.feedbackWarning800,
        );
      case DonationStatus.received:
        return const _DonationStatusTag(
          text: 'Recibido',
          backgroundColor: ColorsConstant.feedbackSuccess050,
          borderColor: ColorsConstant.feedbackSuccess300,
          textColor: ColorsConstant.feedbackSuccess800,
        );
      case DonationStatus.cancelled:
        return const _DonationStatusTag(
          text: 'Cancelado',
          backgroundColor: ColorsConstant.feedbackError050,
          borderColor: ColorsConstant.feedbackError300,
          textColor: ColorsConstant.feedbackError800,
        );
    }
  }
}

class _DonationStatusTag extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;

  const _DonationStatusTag({
    required this.text,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 92),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child: AppText.semiBold(
        text,
        fontSize: 12,
        fontColor: textColor,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class AuthenticatedDonationItem extends StatelessWidget {
  final String donationId;
  final String text;
  final DonationStatus status;
  const AuthenticatedDonationItem({
    super.key,
    this.donationId = '',
    this.text = '',
    this.status = DonationStatus.pending,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: donationId.isEmpty
          ? null
          : () => AutoRouter.of(context).push(
                DonationDetailPageRoute(donationId: donationId),
              ),
      behavior: HitTestBehavior.opaque,
      child: Row(
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
      ),
    );
  }
}
