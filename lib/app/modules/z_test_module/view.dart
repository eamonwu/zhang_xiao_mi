import 'dart:math';
import 'dart:ui';

import 'package:account_book/app/global/widgets/wave_loding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ZTestModulePage extends StatelessWidget {
  const ZTestModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: [
      CustomPaint(painter: MyPainter(), size: Size(150.h, 150.h)),
      Container(
          width: 110.h,
          height: 110.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Center(
              child: Container(
                  width: 68.h,
                  height: 60.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("共计(元)", style: TextStyle(fontSize: 12.sp)),
                        Text("160.04",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold))
                      ]))))
    ]));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final data = [
      {
        "label": "交通餐饮",
        "val": 20.0,
      },
      {
        "label": "交通餐饮",
        "val": 20.0,
      },
      {
        "label": "交通餐饮",
        "val": 20.0,
      },
      {
        "label": "交通餐饮",
        "val": 20.0,
      },
      {
        "label": "交通餐饮",
        "val": 20.0,
      },
    ];
    double sum = 0.0;
    for (var element in data) {
      sum += element["val"] as double;
    }
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple
    ];
    final angles = [];
    final sweepAngles = [];

    Random random = Random();
    angles.add(pi * random.nextDouble());
    for (int i = 0; i < data.length; i++) {
      double offset = 2 * pi * (data[i]["val"] as double) / sum;
      sweepAngles.add(offset);
      if (i != data.length - 1) {
        angles.add(angles[i] + offset);
      }
    }

    for (var i = 0; i < data.length; i++) {
      paint.color = colors[i % colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), angles[i],
          sweepAngles[i], true, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
