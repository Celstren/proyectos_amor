import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_image/app_rounded_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppSuccessTopPopUp extends StatelessWidget {
  final String title;
  final String message;
  const AppSuccessTopPopUp({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorsConstant.neutralWhite,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: AppRoundedIcon(
                  background: ColorsConstant.feedbackSuccess600,
                  icon: AppIcon.checkIcon(
                    color: ColorsConstant.neutralWhite,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              AppText.semiBold(
                title,
                fontSize: 20,
                fontColor: ColorsConstant.skyBlue950,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              AppText.normal(
                message,
                fontSize: 14,
                fontColor: ColorsConstant.text400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showAppSuccessTopPopUp(BuildContext context, { required String title, required String message }) {
  showDialog(
    context: context,
    builder: (context) => AppSuccessTopPopUp(
      title: title,
      message: message,
    ),
  );
}
