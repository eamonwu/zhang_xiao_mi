import 'package:account_book/app/global/widgets/black_card.dart';
import 'package:account_book/app/global/widgets/wave_loding.dart';
import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/widgets/head_bar.dart';
import 'logic.dart';

class BudgetManageModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BudgetManageModuleLogic>();
    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey.withOpacity(0.5),
                body: Stack(children: [
                  HeadBar(label: "预算管理"),
                  Positioned(
                      top: 114.h,
                      child: Container(
                          color: Colors.white,
                          width: 1.sw,
                          height: 168.h,
                          child: Column(children: [
                            Container(
                                width: 1.sw,
                                height: 84.h,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                  Text("多余预算累加", style: TextStyle(fontSize: 16.sp, letterSpacing: 2)),
                                  Switch(value: false, onChanged: (val) {})
                                ])),
                            Container(
                                width: 1.sw,
                                height: 84.h,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                                  Text("超额支出扣除", style: TextStyle(fontSize: 16.sp, letterSpacing: 2)),
                                  Switch(value: false, onChanged: (val) {})
                                ]))
                          ]))),
                  Positioned(top: 282.h, child: BlackCard()),
                  Positioned(
                      top: 474.h,
                      child: Container(
                        width: 1.sw,
                        height: AppController.safeAreaH - 474.h,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _itemProgress("食品餐饮", 10.00, 30.00, Colors.white, Colors.black),
                              _itemProgress("出行交通", 0.00, 50.00, Colors.black, Colors.white),
                            ],
                          ),
                        ),
                      ))
                ]))));
  }

  Widget _itemProgress(String label, double pay, double quote, Color bgColor, Color textColor) {
    return Container(
        width: 364.w,
        height: 120.h,
        margin: EdgeInsets.all(14.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.h), color: bgColor),
        child: Stack(children: [
          Positioned(
              left: 45.w,
              top: 36.h,
              child: Text(label, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: textColor))),
          Positioned(
              left: 45.w,
              top: 70.h,
              child: Text("已支出: ${pay.toStringAsFixed(2)}", style: TextStyle(fontSize: 16.sp, color: Colors.grey.withOpacity(0.84)))),
          Positioned(
              // top: 474.h,
              left: 260.w,
              child: Container(
                  width: 64.w,
                  height: 120.h,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    FlutterWaveLoading(
                      width: 64.w,
                      height: 64.w,
                      progress: 1-(pay / quote),
                      progressColor: textColor,
                      color: Colors.blue,
                      isOval: true,
                    ),
                    Text("${pay.toInt()}/${quote.toInt()}", style: TextStyle(fontSize: 14.sp, color: textColor))
                  ])))
        ]));
  }
}
