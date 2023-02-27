import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChart extends StatelessWidget {
  PieChart({Key? key}) : super(key: key);

  static List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple
  ];
  final data = [
    {
      "label": "食品餐饮",
      "val": 42.10,
    },
    {
      "label": "出行交通",
      "val": 33.21,
    },
    {
      "label": "休闲娱乐",
      "val": 22.09,
    },
    {
      "label": "购物消费",
      "val": 12.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 367.w,
        height: 268.h,
        margin: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.h), color: Colors.white),
        child: Stack(children: [
          Positioned(
              left: 31.w,
              top: 21.h,
              child: Text("消费占比",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ))),
          Positioned(
              top: 82.h,
              left: 38.h,
              child: SizedBox(
                width: 300.w,
                height: 150.h,
                child: Row(
                  children: [
                    _pieChart(data),
                    _dataField(data),
                  ],
                ),
              )),
        ]));
  }

  Widget _pieChart(List data) {
    double sum = 0.0;
    for (var element in data) {
      sum += element["val"] as double;
    }
    return SizedBox(
        width: 150.w,
        height: 150.h,
        child: Stack(alignment: Alignment.center, children: [
          CustomPaint(painter: MyPainter(data: data), size: Size(150.h, 150.h)),
          Container(
              width: 110.h,
              height: 110.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Center(
                  child: SizedBox(
                      width: 68.h,
                      height: 60.h,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("共计(元)", style: TextStyle(fontSize: 12.sp)),
                            Text("${sum.toStringAsFixed(2)}",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold))
                          ]))))
        ]));
  }

  Widget _dataField(List data) {
    double sum = 0.0;
    for (var element in data) {
      sum += element["val"] as double;
    }
    return Container(
      height: 150.h,
      width: 150.w,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        for (int i = 0; i < data.length; i++)
          Container(
              child: Row(children: [
            Container(
              width: 12.h,
              height: 12.h,
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                  color: colors[i % data.length], shape: BoxShape.circle),
            ),
            Text(data[i]["label"]),
            Expanded(child: Container()),
            Text(
              "${(data[i]["val"] as double) * 100 ~/ sum}%",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]))
      ]),
    );
  }
}

class MyPainter extends CustomPainter {
  final data;

  MyPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    double sum = 0.0;
    for (var element in data) {
      sum += element["val"] as double;
    }
    final paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final angles = [];
    final sweepAngles = [];

    angles.add(pi * DateTime.now().hour/24);
    for (int i = 0; i < data.length; i++) {
      double offset = 2 * pi * (data[i]["val"] as double) / sum;
      sweepAngles.add(offset);
      if (i != data.length - 1) {
        angles.add(angles[i] + offset);
      }
    }

    for (var i = 0; i < data.length; i++) {
      paint.color = PieChart.colors[i % PieChart.colors.length];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), angles[i],
          sweepAngles[i], true, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
