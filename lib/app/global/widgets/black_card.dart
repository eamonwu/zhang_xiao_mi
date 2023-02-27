import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlackCard extends StatelessWidget {
  const BlackCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 428.w,
        height: 192.h,
        color: Colors.white,
        child: Center(
            child: Container(
                width: 404.w,
                height: 142.h,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10.h)),
                child: Stack(children: [
                  Positioned(
                      left: 82.w,
                      child: Container(
                          width: 217.w,
                          height: 142.h,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                  stops: const [0.0876, 0.6124],
                                  colors: [Colors.white.withOpacity(0), const Color.fromRGBO(255, 255, 255, 0.15)])))),
                  Positioned(
                      left: 243.w,
                      bottom: -10.h,
                      child: Container(
                          width: 20.h,
                          height: 20.h,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white))),
                  Positioned(
                      left: 243.w,
                      top: -10.h,
                      child: Container(
                          width: 20.h,
                          height: 20.h,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white))),
                  Positioned(
                      left: 82.w,
                      child: CustomPaint(
                          painter: MyPainter(), size: Size(60.w, 142.h), child: Container(width: 60.w, height: 142.h)))
                ]))));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
