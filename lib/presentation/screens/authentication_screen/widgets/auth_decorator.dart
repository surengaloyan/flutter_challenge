import 'package:flutter/material.dart';
import 'package:flutter_challenge/presentation/theme/challenge_color_theme.dart';

class AuthDecorator extends StatelessWidget {
  const AuthDecorator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = ChallengeColorTheme.of(context);

    return CustomPaint(
      painter: _DecorationPainter(color: colorTheme.backgroundSecondary),
    );
  }
}

class _DecorationPainter extends CustomPainter {
  const _DecorationPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final firstCurveControlPoint = Offset(size.width * 0.94, 210);
    final firstCurveEndPoint = Offset(size.width * 0.84, 195);
    final secondCurveControlPoint = Offset(size.width * 0.78, 185);
    final secondCurveEndPoint = Offset(size.width * 0.7, 190);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 257);
    path.quadraticBezierTo(
      firstCurveControlPoint.dx,
      firstCurveControlPoint.dy,
      firstCurveEndPoint.dx,
      firstCurveEndPoint.dy,
    );
    path.quadraticBezierTo(
      secondCurveControlPoint.dx,
      secondCurveControlPoint.dy,
      secondCurveEndPoint.dx,
      secondCurveEndPoint.dy,
    );
    path.lineTo(0, 255);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
