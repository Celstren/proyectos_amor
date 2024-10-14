import 'package:flutter/material.dart';

class AppSlideTransition extends StatefulWidget {
  final Widget child;
  const AppSlideTransition({super.key, required this.child});

  @override
  State<AppSlideTransition> createState() => _AppSlideTransitionState();
}

class _AppSlideTransitionState extends State<AppSlideTransition>
    with TickerProviderStateMixin {
  final oldBegin = const Offset(0.0, 1.0);
  final oldEnd = Offset.zero;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SlideTransition(
        position: Tween(begin: oldBegin, end: oldEnd).animate(_animation),
        child: widget.child,
      );
}
