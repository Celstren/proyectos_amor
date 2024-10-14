import 'package:flutter/material.dart';

class AppFadeSlideTransition extends StatefulWidget {
  final Tween<Offset> offsetTween;
  final Widget child;
  const AppFadeSlideTransition({super.key, required this.offsetTween, required this.child});

  @override
  State<AppFadeSlideTransition> createState() => _AppFadeSlideTransitionState();
}

class _AppFadeSlideTransitionState extends State<AppFadeSlideTransition>
    with TickerProviderStateMixin {
  final opacityOldTween = Tween(begin: 0.0, end: 1.0);
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
        position: widget.offsetTween.animate(_animation),
        child: FadeTransition(
          opacity: opacityOldTween.animate(_animation),
          child: widget.child,
        ),
      );
}
