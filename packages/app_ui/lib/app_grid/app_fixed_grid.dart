import 'package:flutter/material.dart';

class AppFixedGrid extends StatelessWidget {
  final List<Widget> items;
  final int runLength;
  final double runSpacing;
  final double spacing;
  const AppFixedGrid({
    super.key,
    required this.items,
    this.runLength = 2,
    this.runSpacing = 12,
    this.spacing = 12,
  }) : assert(runLength < items.length,
  'run length must be less than items length');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
        (items.length / runLength).ceil(),
            (index) => Padding(
          padding: index == 0
              ? EdgeInsets.zero
              : EdgeInsets.only(top: spacing),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              runLength,
                  (runIndex) => (index * runLength) + runIndex < items.length
                  ? Expanded(
                child: Padding(
                  padding: runIndex == 0
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: runSpacing),
                  child: items[(index * runLength) + runIndex],
                ),
              )
                  : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
