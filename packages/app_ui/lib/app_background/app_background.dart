import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsConstant.background,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorsConstant.skyBlue950,
                  Color(0xFF0A1C44),
                ],
                stops: [0, 1],
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
