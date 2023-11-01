import 'package:advanced_widgets/ui/theme/colors/appcolors.dart';
import 'package:flutter/material.dart';

class WeatherIndicator extends CustomPainter {
  WeatherIndicator(
      {required this.value, required this.themeColors});

  final double value;
  final AppColorTheme themeColors;


  @override
  void paint(Canvas canvas, Size size) {

    final painterSun = Paint()
        ..color = themeColors.sun
        ..style = PaintingStyle.fill;
    final painterCloud = Paint()
      ..color = themeColors.cloud.withOpacity((value));

    canvas.drawCircle(Offset(size.height/2, size.width/3), 30, painterSun);

    Path cloudPath = Path();
    cloudPath.moveTo(size.height * 0.266,size.width * 0.566);
    cloudPath.arcToPoint(Offset(size.height * 0.4, size.width * 0.366),
        radius: Radius.circular(size.height*0.0667),
    clockwise: true);

    cloudPath.arcToPoint(Offset(size.height*0.6333, size.height * 0.4),
        radius: Radius.elliptical(8,7),
        clockwise: true);

    cloudPath.arcToPoint(Offset(100, 85),
        radius: Radius.circular(8),
        clockwise: true);

    // cloudPath.moveTo(size.width*0.15,size.height*0.45);
    // cloudPath.arcToPoint(Offset(size.width*0.3, size.height*0.35),
    //     radius: Radius.circular(8),
    //     clockwise: true)

    // path_0.lineTo(size.width*0.2200000,size.height*0.2733333);
    // path_0.lineTo(size.width*0.2200000,size.height*0.2800000);
    // path_0.lineTo(size.width*0.7400000,size.height*0.2000000);
    // path_0.lineTo(size.width*0.7466667,size.height*0.2133333);
    // path_0.lineTo(size.width*0.9733333,size.height*0.4666667);

    // cloudPath.arcToPoint(Offset(70, 120),
    //     radius: Radius.circular(20),
    //     clockwise: true);
    //
    // cloudPath.arcToPoint(Offset(130, 97),
    //     radius: Radius.circular(18),
    //     clockwise: true);
    //
    // cloudPath.arcToPoint(Offset(130, 97),
    //     radius: Radius.circular(18),
    //     clockwise: true);
    //
    // cloudPath.arcToPoint(Offset(130, 97),
    //     radius: Radius.circular(18),
    //     clockwise: true);


    cloudPath.close();

    canvas.drawPath(cloudPath,painterCloud);


    // canvas.drawCircle(Offset(100, 91), 25, painterCloud);
    // canvas.drawCircle(Offset(70, 95), 20, painterCloud);
    // canvas.drawCircle(Offset(130, 97), 18, painterCloud);
    // canvas.drawRect(Rect.fromCenter(center: Offset(97, 108), width: 75, height: 10), painterCloud);
   


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
