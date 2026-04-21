import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectos_amor/features/onboarding/logic_holders/cubits/change_onboarding_step_cubit/change_onboarding_step_cubit.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_images.dart';
import 'package:proyectos_amor/features/onboarding/onboarding_strings.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_bottom/onboarding_bottom.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_header/onboarding_header.dart';
import 'package:proyectos_amor/features/onboarding/presentation/content/onboarding_steps/onboarding_step_three/onboarding_chip.dart';
import 'package:proyectos_amor/router/app_router.gr.dart';

class OnboardingStepThree extends StatefulWidget {
  const OnboardingStepThree({super.key});

  @override
  State<OnboardingStepThree> createState() => _OnboardingStepThreeState();
}

class _OnboardingStepThreeState extends State<OnboardingStepThree> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 19),
          const OnboardingHeader(
            asset: OnboardingImages.splashImageThree,
            title1: OnboardingStrings.splashThreeTitle1,
            title2: OnboardingStrings.splashThreeTitle2,
            subTitle: OnboardingStrings.splashThreeSubTitle,
          ),
          const SizedBox(height: 50),
          const _OnboardingChipMarquee(
            duration: Duration(seconds: 14),
            chips: <Widget>[
              OnboardingChip.yellow(text: '+12k voluntarios'),
              OnboardingChip.black(text: '+22 iniciativas'),
              OnboardingChip.yellow(text: '+200 sueños cumplidos'),
            ],
          ),
          const SizedBox(height: 15),
          const _OnboardingChipMarquee(
            reverse: true,
            duration: Duration(seconds: 18),
            chips: <Widget>[
              OnboardingChip.black(text: '+102 programas'),
              OnboardingChip.yellow(text: '+49 familias beneficiadas'),
              OnboardingChip.black(text: '+17k almuerzos entregados'),
            ],
          ),
          const SizedBox(height: 15),
          const _OnboardingChipMarquee(
            duration: Duration(seconds: 16),
            chips: <Widget>[
              OnboardingChip.yellow(text: '+200 sueños cumplidos'),
              OnboardingChip.black(text: '+17k almuerzos entregados'),
              OnboardingChip.yellow(text: '+22 iniciativas'),
            ],
          ),
          const SizedBox(height: 24),
          const Spacer(),
          OnboardingBottom(
            onBack: () => context.read<ChangeOnboardingStepCubit>().change(1),
            onFinish: () => AutoRouter.of(context).replaceAll([
              const LoginPageRoute(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _OnboardingChipMarquee extends StatefulWidget {
  final List<Widget> chips;
  final Duration duration;
  final bool reverse;

  const _OnboardingChipMarquee({
    required this.chips,
    required this.duration,
    this.reverse = false,
  });

  @override
  State<_OnboardingChipMarquee> createState() => _OnboardingChipMarqueeState();
}

class _OnboardingChipMarqueeState extends State<_OnboardingChipMarquee>
    with SingleTickerProviderStateMixin {
  final _contentKey = GlobalKey();
  late final AnimationController _controller;
  double _contentWidth = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureContent());
  }

  @override
  void didUpdateWidget(covariant _OnboardingChipMarquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      _controller.repeat();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureContent());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _measureContent() {
    final renderBox =
        _contentKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !mounted) return;

    final width = renderBox.size.width;
    if (width != _contentWidth) {
      setState(() => _contentWidth = width);
    }
  }

  Widget _buildContent({Key? key}) {
    return Row(
      key: key,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: 40,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final distance = _contentWidth * _controller.value;
            final offset =
                widget.reverse ? -_contentWidth + distance : -distance;

            return Transform.translate(
              offset: Offset(offset, 0),
              child: child,
            );
          },
          child: OverflowBox(
            alignment: Alignment.centerLeft,
            maxWidth: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildContent(key: _contentKey),
                _buildContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
