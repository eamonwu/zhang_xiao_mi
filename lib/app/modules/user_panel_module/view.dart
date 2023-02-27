import 'package:account_book/app/global/widgets/black_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import 'logic.dart';

class UserPanelModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<UserPanelModuleLogic>();

    return Container(
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey.withOpacity(0.3),
                body: Stack(children: [
                  Positioned(top: 0, child: _headBar()),

                  /// avatar
                  Positioned(
                      left: 32.w,
                      top: 121.h,
                      child: Container(
                          width: 85.h,
                          height: 85.h,
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle, border: Border.all(color: Colors.white)))),
                  Positioned(
                      left: 131.w, top: 148.h, child: Container(width: 200.w, height: 30.h, color: Colors.white)),
                  Positioned(
                      left: 362.w,
                      top: 141.h,
                      child: Container(
                          width: 45.h,
                          height: 45.h,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.h)),
                          child: const Image(image: Svg("assets/svg/dots-horizontal.svg")))),
                  Positioned(top: 243.h, child: BlackCard()),
                  Positioned(
                      top: 435.h,
                      child: Container(
                          width: 1.sw,
                          height: 137.h,
                          color: Colors.white,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                            Container(
                                width: 174.w,
                                height: 107.h,
                                decoration:
                                    BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10.h)),
                                child: Center(
                                    child: Text("资金账户",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16.sp, letterSpacing: 2)))),
                            Container(
                                width: 174.w,
                                height: 107.h,
                                decoration:
                                    BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10.h)),
                                child: Center(
                                    child: Text("账本管理",
                                        style:
                                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, letterSpacing: 2))))
                          ])))
                ]))));
  }

  Widget _headBar() {
    return Container(
        width: 428.w,
        height: 114.h,
        color: Colors.grey.withOpacity(0),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
              left: 32.w,
              top: 39.h,
              child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      width: 65.w,
                      height: 45.h,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.h)),
                      child:
                          Center(child: Image(width: 35.h, height: 35.h, image: const Svg("assets/svg/undo.svg")))))),
          Positioned(
              left: 346.w,
              top: 36.h,
              child: Container(
                  width: 50.h,
                  height: 50.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.h), color: Colors.white),
                  child: Center(child: Image(image: const Svg("assets/svg/bell.svg"), width: 24.h, height: 24.h))))
        ]));
  }

}

