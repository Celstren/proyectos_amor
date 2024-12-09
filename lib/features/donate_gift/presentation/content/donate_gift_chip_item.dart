import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_images.dart';

class DonateGiftChipItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback? onTap;
  const DonateGiftChipItem({
    super.key,
    this.text = '',
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        decoration: selected
            ? BoxDecoration(
          color: ColorsConstant.splashPrimaryFontColor,
          borderRadius: BorderRadius.circular(56),
        )
            : BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          border: Border.all(color: ColorsConstant.splashPrimaryFontColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (selected)
              ...[
                const SizedBox(
                  height: 16,
                  width: 16,
                  child: Center(
                    child: AppImage.assetSvg(
                      asset: DonateGiftImages.starIcon,
                      color: ColorsConstant.secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            AppText.normal(
              text,
              fontSize: 12,
              fontColor: selected
                  ? ColorsConstant.neutralWhite
                  : ColorsConstant.splashPrimaryFontColor,
              textAlign: TextAlign.center,
            ),
            if (selected)
              ...[
                const SizedBox(width: 8),
                const SizedBox(
                  height: 16,
                  width: 16,
                  child: Center(
                    child: AppImage.assetSvg(
                      asset: DonateGiftImages.starIcon,
                      color: ColorsConstant.secondaryColor,
                    ),
                  ),
                ),
              ],
          ],
        ),
      ),
    );
  }
}
