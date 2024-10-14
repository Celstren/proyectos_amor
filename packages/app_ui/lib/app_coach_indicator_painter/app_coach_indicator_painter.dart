import 'package:flutter/material.dart';

class AppCoachIndicatorPainter extends CustomPainter {
  final Color color;
  final double radius;
  final double triangleSide;

  AppCoachIndicatorPainter({this.color = Colors.white, this.radius = 8, this.triangleSide = 15});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    var path = Path()
      ..moveTo(radius, 0)
      ..quadraticBezierTo(0, 0, 0, radius)
      ..lineTo(0, size.height - radius - triangleSide)
      ..quadraticBezierTo(0, size.height - triangleSide, radius, size.height - triangleSide)
      ..lineTo((size.width * .5) - triangleSide, size.height - triangleSide)
      ..lineTo((size.width * .5), size.height)
      ..lineTo((size.width * .5) + triangleSide, size.height - triangleSide)
      ..lineTo(size.width - radius, size.height - triangleSide)
      ..quadraticBezierTo(size.width, size.height - triangleSide, size.width, size.height - triangleSide - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(AppCoachIndicatorPainter oldDelegate) => true;
}
