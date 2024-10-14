import 'package:app_ui/app_text/app_text.dart';
import 'package:app_ui/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSuccessSnackBar(BuildContext context, {required String message}) =>
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.primarySnackBarSuccessColor,
              content: AppText.semiBold(
                message,
                fontColor: context.primarySnackBarTextColor,
              ),
            ),
          );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showErrorSnackBar(BuildContext context, {required String message}) =>
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.primarySnackBarErrorColor,
              content: AppText.semiBold(
                message,
                fontColor: context.primarySnackBarTextColor,
              ),
            ),
          );

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showWarningSnackBar(BuildContext context, {required String message}) =>
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.primarySnackBarWarningColor,
              content: AppText.semiBold(
                message,
                fontColor: context.primarySnackBarTextColor,
              ),
            ),
          );
}
