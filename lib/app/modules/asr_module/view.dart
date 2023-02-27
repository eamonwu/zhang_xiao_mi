import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

Widget _circleOfCloud(double radius, double top, double left) {
  return Positioned(
      left: left,
      top: top,
      child: Container(
        width: radius,
        height: radius,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Color(0xffBBC1FD)),
      ));
}

class ASRModulePage extends StatelessWidget {
  var cloud = [
    _circleOfCloud(10.h, 67.h, -54.h),
    _circleOfCloud(20.h, 52.h, -40.h),
    _circleOfCloud(30.h, 46.h, -23.h),
    _circleOfCloud(40.h, 22.h, -19.h),
    _circleOfCloud(40.h, 50.h, -3.h),
    _circleOfCloud(40.h, 38.h, 88.h),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ASRModuleLogic>(
        builder: (logic) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.white10,
              child: SafeArea(
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      top: 161.h,
                      child: Text(logic.info[logic.status]["statusText"]!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              letterSpacing: 2))),
                  Positioned(
                      top: 211.h,
                      child: Text("如：今天吃早餐花了20元",
                          style: TextStyle(fontSize: 18.sp, letterSpacing: 1))),
                  Positioned(
                      top: 430.h,
                      child: GestureDetector(
                          onTap: () => logic.clickBtn(),
                          child: Container(
                              width: 100.h,
                              height: 100.h,
                              child: Stack(
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                        child: Container(
                                      width: 80.h,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle),
                                    )),
                                    for (int i = 0; i < cloud.length; i++)
                                      cloud[i],
                                    Positioned(
                                        top: 111.h,
                                        child: Text(
                                          logic.info[logic.status]["promptText"]!,
                                          style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2),
                                        ))
                                  ]))))
                ]),
              ),
            )));
  }
}
