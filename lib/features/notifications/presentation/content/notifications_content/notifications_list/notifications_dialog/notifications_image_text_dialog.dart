import 'package:app_ui/app_button/app_button.dart';
import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/notifications/notifications_strings.dart';

class NotificationsImageTextDialog extends StatelessWidget {
  final String timeAgo;
  final String title;
  final String image;
  final String subTitle;
  final String description;
  const NotificationsImageTextDialog({
    super.key,
    this.timeAgo = '',
    this.title = '',
    this.image = '',
    this.subTitle = '',
    this.description = '',
});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(SizeConstants.xl),
        margin: const EdgeInsets.only(
            left: SizeConstants.xl,
            right: SizeConstants.xl,
            bottom: SizeConstants.xl),
        decoration: BoxDecoration(
          color: ColorsConstant.neutralWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorsConstant.text100),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                  child: AppText.semiBold(
                    NotificationsStrings.notificationsDialogTitle,
                    fontColor: ColorsConstant.text950,
                    fontSize: 18,
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(width: SizeConstants.sm),
                GestureDetector(
                  onTap: AutoRouter.of(context).maybePop,
                  behavior: HitTestBehavior.opaque,
                  child: const Icon(
                    Icons.close,
                    color: ColorsConstant.text950,
                    size: 24,
                  ),
                ),
              ],
            ),
            if (image.isNotEmpty) ...[
              const SizedBox(height: SizeConstants.lg),
              AppImage.assetImage(
                asset: image,
                fit: BoxFit.contain,
                height: 120,
              ),
            ],
            if (title.isNotEmpty) ...[
              const SizedBox(height: SizeConstants.lg),
              AppText.bold(
                title,
                fontColor: ColorsConstant.text950,
                fontSize: 18,
                textAlign: TextAlign.start,
              ),
            ],
            if (subTitle.isNotEmpty) ...[
              const SizedBox(height: SizeConstants.sm),
              AppText.semiBold(
                subTitle,
                fontColor: ColorsConstant.text950,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
            ],
            if (description.isNotEmpty) ...[
              const SizedBox(height: SizeConstants.sm),
              AppText.normal(
                description,
                fontColor: ColorsConstant.text600,
                fontSize: 12,
                textAlign: TextAlign.start,
              ),
            ],
            const SizedBox(height: SizeConstants.lg),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                text: NotificationsStrings.notificationsDialogCancelButton,
                onTap: AutoRouter.of(context).maybePop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showNotificationsImageTextDialog(
    BuildContext context, {
      String timeAgo = '',
      String image = '',
      String title = '',
      String subTitle = '',
      String description = '',
    }) {
  showDialog(
    context: context,
    builder: (context) => NotificationsImageTextDialog(
      timeAgo: timeAgo,
      image: image,
      title: title,
      subTitle: subTitle,
      description: description,
    ),
  );
}