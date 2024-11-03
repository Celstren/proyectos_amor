import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';

class AppProgressBar extends StatelessWidget {
  final String label;
  final double percentage;
  final Color color;
  final Widget? child;
  const AppProgressBar({super.key, this.label = '', this.percentage = .0, this.color = ColorsConstant.skyBlue950, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorsConstant.text200,
          ),
          child: AnimatedFractionallySizedBox(
            widthFactor: percentage,
            heightFactor: 1,
            alignment: FractionalOffset.centerLeft,
            duration: const Duration(milliseconds: 500),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        child ?? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppText.medium(
              label,
              fontColor: ColorsConstant.text400,
              fontSize: 14,
              textAlign: TextAlign.start,
            ),
            AppText.medium(
              '${(percentage * 100).ceil()}%',
              fontColor: ColorsConstant.text400,
              fontSize: 14,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
