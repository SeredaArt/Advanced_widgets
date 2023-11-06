import 'package:advanced_widgets/ui/theme/colors/appcolors.dart';
import 'package:flutter/material.dart';

class WeatherIndicator extends CustomPainter {
  WeatherIndicator({required this.value, required this.themeColors});

  final double value;
  final AppColorTheme themeColors;

  @override
  void paint(Canvas canvas, Size size) {
    final painterSun = Paint()
      ..color = themeColors.sun.withOpacity(_getSunOpacity(value))
      ..style = PaintingStyle.fill;
    final painterCloud = Paint()
      ..style = PaintingStyle.fill
      ..color = value > 0.7
          ? themeColors.darkCloud.withOpacity(_getCloudOpacity(value))
          : themeColors.cloud.withOpacity(_getCloudOpacity(value));
    final painterRain = Paint()
      ..color = themeColors.drops.withOpacity(_getDropsOpacity(value))
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.height / 2, size.width / 3), 30, painterSun);

    Path cloudPath = Path();
    cloudPath.moveTo(size.height * 0.266, size.width * 0.566);
    cloudPath.arcToPoint(Offset(size.height * 0.4, size.width * 0.366),
        radius: Radius.circular(size.height * 0.0667), clockwise: true);

    cloudPath.arcToPoint(Offset(size.height * 0.6333, size.height * 0.4),
        radius: Radius.elliptical(8, 7), clockwise: true);

    cloudPath.arcToPoint(Offset(100, 85),
        radius: Radius.circular(8), clockwise: true);
    cloudPath.close();
    canvas.drawPath(cloudPath, painterCloud);

    Path rainPath = Path();
    rainPath.moveTo(58, 85);
    rainPath.lineTo(49, 100);

    rainPath.moveTo(73, 85);
    rainPath.lineTo(64, 100);

    rainPath.moveTo(88, 85);
    rainPath.lineTo(79, 100);

    canvas.drawPath(rainPath, painterRain);
  }

  double _getDropsOpacity(double value) {
    if (value < 0.7) {
      return 0;
    }

    return 10 / 3 * value - 7 / 3;
  }

  double _getCloudOpacity(double value) {
    if (value < 0.2) {
      return 0;
    }

    return 10 / 8 * value - 0.25;
  }

  double _getSunOpacity(double value) {
    if (value > 0.7) {
      return 0;
    }

    if (value == 0) {
      return 1;
    }

    return 1 - value;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
