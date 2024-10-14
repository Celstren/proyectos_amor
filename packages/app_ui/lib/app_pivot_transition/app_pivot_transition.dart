import 'dart:math';
import 'package:flutter/material.dart';

class AppPivotTransition extends AnimatedWidget {
  /// Creates a rotation transition.
  ///
  /// The [turns] argument must not be null.
  const AppPivotTransition({
    super.key,
    this.angle = pi,
    this.alignment = FractionalOffset.center,
    required Animation<double> turns,
    required this.child,
  }) : super(listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The pivot point to rotate around.
  final FractionalOffset alignment;

  /// The widget below this widget in the tree.
  final Widget child;

  final double angle;

  @override
  Widget build(BuildContext context) {
    final turnsValue = turns.value;
    final transform = Matrix4.rotationZ(turnsValue * angle);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}