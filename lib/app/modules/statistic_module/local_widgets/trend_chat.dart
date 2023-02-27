import 'dart:math';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendChart extends StatelessWidget {
  const TrendChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 367.w,
        height: 482.h,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.h)),
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(top: 58.h, child: _lineChart()),
          Positioned(
              top: 21.h,
              left: 31.w,
              child: Text("收/支走势",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold))),
          Positioned(top: 324.h, child: _dataField())
        ]));
  }

  Widget _lineChart() {
    return Container(
        width: 340.w,
        height: 210.h,
        color: Colors.white,
        child: Stack(children: [
          Positioned(
              top: 0,
              child: SizedBox(
                  width: 340.w,
                  height: 20.h,
                  child: Stack(children: [
                    Positioned(
                        right: 300.w,
                        child: Text("单位", style: TextStyle(fontSize: 12.sp))),
                    Positioned(
                        right: 0,
                        child: SizedBox(
                            width: 96.w,
                            child: Row(children: [
                              Container(
                                  width: 12.h,
                                  height: 12.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue)),
                              Text("收入", style: TextStyle(fontSize: 12.sp)),
                              Expanded(child: Container()),
                              Container(
                                  width: 12.h,
                                  height: 12.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green)),
                              Text("支出", style: TextStyle(fontSize: 12.sp))
                            ])))
                  ]))),
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                  width: 300.w,
                  height: 20.h,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("2/1", style: TextStyle(fontSize: 12.sp)),
                        Text("2/7", style: TextStyle(fontSize: 12.sp)),
                        Text("2/13", style: TextStyle(fontSize: 12.sp)),
                        Text("2/19", style: TextStyle(fontSize: 12.sp)),
                        Text("2/25", style: TextStyle(fontSize: 12.sp)),
                        Container()
                      ]))),
          Positioned(
              top: 20.h,
              child: SizedBox(
                  height: 170.h,
                  width: 340.w,
                  // color: Colors.green,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 5; i > 0; i--) _gradeLine(i * 200.0),
                        _gradeLine(0.0)
                      ]))),

          /// 画布
          Positioned(
              top: 20.h + 7.h,
              right: 0,
              child: CustomPaint(
                  child: CustomPaint(
                      size: Size(300.w, 170.h - 14.h),
                      painter: MyPainter(
                        incomeData: [
                          {"value": 64.4737964921839},
                          {"value": 49.83244440682472},
                          {"value": 49.65470601458659},
                          {"value": 17.833538883690695},
                          {"value": 10.464232854086876},
                          {"value": 128.32651064364747},
                          {"value": 21.19322210202991},
                          {"value": 96.48087060528106},
                          {"value": 9.499543514048686},
                          {"value": 64.59471901395685},
                          {"value": 14.272039010793733},
                          {"value": 33.02105105967829},
                          {"value": 196.10674469888618},
                          {"value": 2.450829931177538},
                          {"value": 13.175794309198497},
                          {"value": 27.12783880361457},
                          {"value": 24.792784774915816},
                          {"value": 19.345224847944586},
                          {"value": 83.7683964428822},
                          {"value": 8.92532953437197},
                          {"value": 58.1257126229651},
                          {"value": 75.2740226737805},
                          {"value": 34.763680701714375},
                          {"value": 60.28924517437537},
                          {"value": 83.85520665797844},
                          {"value": 27.673048325332407},
                          {"value": 94.61635664477447},
                          {"value": 18.444573311540857},
                          {"value": 47.33724245836845},
                          {"value": 95.75934857631428},
                          {"value": 38.877729431735115},
                          {"value": 75.23524819126125},
                          {"value": 97.34847578142796},
                          {"value": 62.70722012573308},
                          {"value": 79.33412517455339},
                          {"value": 46.79083498805848},
                          {"value": 4.799172472293228},
                          {"value": 92.95126702146278},
                        ],
                        spendData: [
                          {"value": 300.0},
                          {"value": 200.0},
                          {"value": 800.0},
                          {"value": 600.0},
                          {"value": 500.0},
                          {"value": 700.0},
                          {"value": 100.0},
                          {"value": 400.0},
                          {"value": 200.0},
                          {"value": 444.0},
                          {"value": 300.0},
                          {"value": 200.0},
                          {"value": 300.0},
                          {"value": 100.0},
                          {"value": 300.0},
                          {"value": 300.0},
                          {"value": 400.0},
                          {"value": 300.0},
                          {"value": 200.0},
                          {"value": 300.0},
                          {"value": 300.0},
                          {"value": 300.0},
                          {"value": 300.0},
                          {"value": 300.0},
                          {"value": 200.0},
                          {"value": 800.0},
                          {"value": 000.0},
                          {"value": 200.0},
                        ],
                      ))))
        ]));
  }

  Widget _gradeLine(double val) {
    return SizedBox(
        height: 14.h,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(val.toString(), style: TextStyle(fontSize: 12.sp)),
          DottedBorder(
              dashPattern: [5, val > 0.5 ? 10 : 0],
              strokeWidth: 1,
              color: Colors.grey.withOpacity(0.7),
              padding: EdgeInsets.zero,
              child: SizedBox(width: 300.w, height: 0))
        ]));
  }

  Widget _dataField() {
    final data = [
      {
        "date": "02-10",
        "expenditure": 20.00,
        "income": 50.00,
      },
      {
        "date": "02-11",
        "expenditure": 20.00,
        "income": 50.00,
      },
    ];

    return Container(
        color: Colors.yellow,
        width: 304.w,
        height: 132.h,
        child: Column(children: [
          _dataFieldCell(["日期", "支出", "收入", "结余"], true),
          for (int i = 0; i < data.length; i++)
            _dataFieldCell([
              data[i]["date"],
              data[i]["expenditure"],
              data[i]["income"],
              (data[i]["income"] as num) - (data[i]["expenditure"] as num),
            ], false)
        ]));
  }

  Widget _dataFieldCell(List str, bool isField) {
    return Container(
        width: 304.w,
        height: 44.h,
        color: Color(0xffF0EFF2),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
              width: 57.w,
              height: 33.h,
              child: Center(
                  child: Text(str[0].toString(),
                      style: TextStyle(
                          fontSize: isField ? 16.sp : 12.sp,
                          fontWeight: isField ? FontWeight.bold : null)))),
          SizedBox(
              width: 57.w,
              height: 33.h,
              child: Center(
                  child: Text(str[1].toString(),
                      style: TextStyle(
                          fontSize: isField ? 16.sp : 12.sp,
                          fontWeight: isField ? FontWeight.bold : null,
                          color: isField ? null : Colors.red)))),
          SizedBox(
              width: 57.w,
              height: 33.h,
              child: Center(
                  child: Text(str[2].toString(),
                      style: TextStyle(
                          fontSize: isField ? 16.sp : 12.sp,
                          fontWeight: isField ? FontWeight.bold : null,
                          color: isField ? null : Colors.blue)))),
          SizedBox(
              width: 57.w,
              height: 33.h,
              child: Center(
                  child: Text(str[3].toString(),
                      style: TextStyle(
                          fontSize: isField ? 16.sp : 12.sp,
                          fontWeight: isField ? FontWeight.bold : null)))),
        ]));
  }
}

class MyPainter extends CustomPainter {
  List incomeData;
  List spendData;

  MyPainter({required this.incomeData, required this.spendData});

  @override
  void paint(Canvas canvas, Size size) {
    // PaintingStyle.
    final incomeBezierPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..color = Colors.blue;

    final spendBezierPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..color = Colors.green;

    //绘制所有offset点
    canvas.drawPoints(
        PointMode.points,
        _spline(size, incomeData)
            .generateSamples()
            .map((e) => e.value)
            .toList(),
        incomeBezierPaint);

    canvas.drawPoints(
        PointMode.points,
        _spline(size, spendData).generateSamples().map((e) => e.value).toList(),
        spendBezierPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  CatmullRomSpline _spline(Size size, List data) {
    const maxVal = 1000.0;
    List<Offset> controlPoints = [];
    int count = 0;
    double lastDev = 1;
    for (int i = 0; i < data.length; i++) {
      double dx, dy;
      dy = (1 - data[i]["value"]! / maxVal) * size.height;
      dx = i / (data.length - 1) * size.width;
      if (i == 0 || i == data.length - 1) {
        controlPoints.add(Offset(dx, dy));
        continue;
      }
      double lastDy = controlPoints[controlPoints.length - 1].dy;
      double dev = (dy - lastDy) / lastDy;
      // || dev.abs() >= 0.4
      if (count >= 5 || dev * lastDev < 0) {
        controlPoints.add(Offset(dx, dy));
        count = 0;
      } else {
        count++;
      }
      lastDev = dev;
    }

    return CatmullRomSpline(controlPoints);
  }
}
