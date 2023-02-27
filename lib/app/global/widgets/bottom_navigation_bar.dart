import 'dart:ui';

import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:account_book/app/modules/asr_module/view.dart';
import 'package:account_book/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import '../../modules/asr_module/logic.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final appCtl = Get.find<AppController>();
  late SequenceAnimation sequenceAnimation;
  late Animation<double> animation;
  OverlayEntry? asrEntry;
  static final optionCellInfo = [
    {
      "icon": "assets/svg/pencil.svg",
    },
    {
      "icon": "assets/svg/microphone.svg",
    },
    {
      "icon": "assets/svg/camera.svg",
    },
    {
      "icon": "assets/svg/table.svg",
    },
    {
      "icon": "assets/svg/x.svg",
    },
  ];

  @override
  void initState() {
    super.initState();

    // TODO: implement initState
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
            animatable: Tween(begin: 0, end: 1),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: "bottom",
            curve: Curves.easeOut)
        .addAnimatable(
            animatable: Tween(begin: 0.0, end: 1.0),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: "opacity",
            curve: Curves.easeOut)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
            bottom: 0,
            child: Container(
                width: 428.w,
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.h),
                        topLeft: Radius.circular(30.h))))),

        /// book按钮
        Positioned(
            left: 61.w,
            bottom: 25.h,
            child: GestureDetector(
              onTap: () {
                if (appCtl.toBook()) {
                  setState(() {});
                }
              },
              child: Container(
                width: 50.h,
                height: 50.h,
                decoration: BoxDecoration(
                    color: appCtl.currentPage == Routes.BOOK
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(15.h)),
                child: Center(
                  child: Image(
                    width: 24.h,
                    height: 24.h,
                    image: Svg("assets/svg/book.svg"),
                  ),
                ),
              ),
            )),

        /// 统计按钮
        Positioned(
            bottom: 25.h,
            child: GestureDetector(
              onTap: () {
                if (appCtl.toStatistic()) {
                  setState(() {});
                }
              },
              child: Container(
                width: 50.h,
                height: 50.h,
                decoration: BoxDecoration(
                    color: appCtl.currentPage == Routes.STATISTIC
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(15.h)),
                child: Center(
                  child: Image(
                    width: 24.h,
                    height: 24.h,
                    image: Svg("assets/svg/statistic.svg"),
                  ),
                ),
              ),
            )),

        /// 记账按钮
        Positioned(
            right: 36.w,
            bottom: 37.h,
            child: SizedBox(
                width: 100.h,
                height: 660.h,
                child: Stack(children: [
                  Positioned(
                      bottom: 0,
                      child: Container(
                          width: 100.h,
                          height: 100.h,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(40.h)),
                          child: Center(
                              child: Image(
                                  width: 35.h,
                                  height: 35.h,
                                  image: Svg("assets/svg/pencil.svg"))))),
                  _optionCell(1, () {
                    Get.put(ASRModuleLogic());
                    asrEntry = OverlayEntry(builder: (context) => GestureDetector( onTap: () => asrEntry?.remove(),child: ASRModulePage(),));
                    Overlay.of(context)?.insert(asrEntry!);
                  }),
                  _optionCell(2, () {}),
                  _optionCell(3, () {}),
                  _optionCell(4, () {
                    if (controller.status == AnimationStatus.dismissed) {
                      controller.forward();
                    } else if (controller.status == AnimationStatus.completed) {
                      controller.reverse();
                    }
                  }),
                ])))
      ]),
    );
  }

  Widget _optionCell(int index, Function() f) {
    final _intervalH = 137.h;
    return Positioned(
        bottom: ((index) * _intervalH) * sequenceAnimation["bottom"].value,
        child: GestureDetector(
            onTap: f,
            child: Container(
                width: 100.h,
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(sequenceAnimation["opacity"].value),
                    borderRadius: BorderRadius.circular(40.h),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(
                              0.2 * sequenceAnimation["opacity"].value),
                          offset: Offset(0, 3),
                          blurRadius: 2,
                          spreadRadius: 2)
                    ]),
                child: Center(
                    child: Image(
                        width: 35.h,
                        height: 35.h,
                        image: Svg(optionCellInfo[index]["icon"]!),
                        opacity: animation)))));
  }
}
