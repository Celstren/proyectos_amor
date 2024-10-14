import 'package:flutter/material.dart';

class AppFadeTransition extends StatefulWidget {
  final Widget child;
  const AppFadeTransition({super.key, required this.child});

  @override
  State<AppFadeTransition> createState() => _AppFadeTransitionState();
}

class _AppFadeTransitionState extends State<AppFadeTransition> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
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
  Widget build(BuildContext context) => FadeTransition(opacity: _animation, child: widget.child);
}
