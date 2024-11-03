import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_constants/size_constants.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AwardListItem extends StatelessWidget {
  final String name;
  final String asset;
  final String assetEarned;
  final bool earned;
  const AwardListItem({
    super.key,
    this.name = '',
    this.asset = '',
    this.assetEarned = '',
    this.earned = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 113,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 78,
            width: 113,
            child: Center(
              child: AppImage.assetSvg(
                asset: earned ? assetEarned : asset,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: SizeConstants.md),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppText.medium(
              name,
              fontSize: 12,
              fontColor: ColorsConstant.text600,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
