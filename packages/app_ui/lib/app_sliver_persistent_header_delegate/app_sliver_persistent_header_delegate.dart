import 'package:flutter/material.dart';

class AppSliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxSizeExtent;
  final double minSizeExtent;

  AppSliverPersistentHeaderDelegate({ required this.child, this.maxSizeExtent = 72.0, this.minSizeExtent = 72.0 });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => child;

  @override
  double get maxExtent => maxSizeExtent;

  @override
  double get minExtent => minSizeExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}