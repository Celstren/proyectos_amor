import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppAnimationLoadingOverlay extends StatefulWidget {
  const AppAnimationLoadingOverlay({super.key});

  @override
  State<AppAnimationLoadingOverlay> createState() => _AppAnimationLoadingOverlayState();
}

class _AppAnimationLoadingOverlayState extends State<AppAnimationLoadingOverlay> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller
      ..stop()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SizedBox(
          height: 180,
          width: 180,
          child: Lottie.asset(
            'packages/app_ui/assets/animations/Loading_Animation.json',
            controller: _controller,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              _controller
                ..duration = const Duration(milliseconds: 1000)
                ..repeat();
            },
          ),
        ),
      ),
    );
  }
}

class DialogAnimatedLoading {
  bool _dialogOpen = false;

  Future<void> show(BuildContext context, { bool dismissible = true }) async {
    if (!_dialogOpen) {
      _dialogOpen = true;
      await showDialog(
        context: context,
        barrierDismissible: dismissible,
        useSafeArea: false,
        builder: (_) => const AppAnimationLoadingOverlay(),
      );
      _dialogOpen = false;
    }
  }

  Future<void> hide(BuildContext context) async {
    if (_dialogOpen) {
      Navigator.pop(context);
      _dialogOpen = false;
    }
  }
}
