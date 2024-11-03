import 'package:flutter/material.dart';

class AppCoachTopRightIndicatorPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double triangleSide;
  final double rightSpace;

  AppCoachTopRightIndicatorPainter({this.color = Colors.white, this.rightSpace = 8, this.radius = 8, this.triangleSide = 15});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    var path = Path()
      ..moveTo(radius, triangleSide)
      ..quadraticBezierTo(0, triangleSide, 0, radius + triangleSide)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, 8 + triangleSide)
      ..quadraticBezierTo(size.width, triangleSide, size.width - rightSpace, triangleSide)
      ..lineTo(size.width - rightSpace - 18, 0)
      ..lineTo(size.width - rightSpace - 36, triangleSide)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AppCoachTopRightIndicatorPainter oldDelegate) => true;
}
