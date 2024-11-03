import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_image/app_image.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationItem extends StatelessWidget {
  final String label;
  final String asset;
  final bool selected;
  final VoidCallback onTap;
  const AppBottomNavigationItem({
    super.key,
    this.label = '',
    this.asset = '',
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppImage.assetSvg(
            asset: asset,
            size: 20,
            color: selected ? ColorsConstant.skyBlue950 : ColorsConstant.text300,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 16,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedPositioned(
                  top: selected ? -20 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 16,
                    width: 70,
                    child: Center(
                      child: AppText.normal(
                        label,
                        fontSize: 12,
                        fontColor: ColorsConstant.text300,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: selected ? 0 : 20,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: 16,
                    width: 70,
                    child: Center(
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          color: ColorsConstant.skyBlue950,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
