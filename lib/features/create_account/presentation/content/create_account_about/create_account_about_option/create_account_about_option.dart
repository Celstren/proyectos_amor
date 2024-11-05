import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_icon.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class CreateAccountAboutOption extends StatelessWidget {
  final String text;
  final String description;
  final String asset;
  final bool selected;
  final VoidCallback onTap;
  const CreateAccountAboutOption({
    super.key,
    this.text = '',
    this.description = '',
    this.asset = '',
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.all(SizeConstants.lg),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsConstant.text200),
              color: selected
                  ? ColorsConstant.neutralBlack
                  : ColorsConstant.neutralWhite,
              borderRadius: BorderRadius.circular(56),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AppIcon(asset: asset),
                const SizedBox(width: SizeConstants.sm),
                Expanded(
                  child: AppText.medium(
                    text,
                    fontSize: 12,
                    fontColor: selected
                        ? ColorsConstant.neutralWhite
                        : ColorsConstant.text950,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: SizeConstants.sm),
                AppIcon(asset: asset),
              ],
            ),
          ),
        ),
        if (selected)
          ...[
            const SizedBox(height: SizeConstants.sm),
            AppText.normal(
              description,
              fontSize: 12,
              fontColor: ColorsConstant.text950,
              textAlign: TextAlign.start,
            ),
          ],
      ],
    );
  }
}
