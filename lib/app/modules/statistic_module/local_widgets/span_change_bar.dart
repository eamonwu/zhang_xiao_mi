import 'package:account_book/app/modules/statistic_module/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SpanChangeBar extends StatefulWidget {
  const SpanChangeBar({Key? key}) : super(key: key);

  @override
  State<SpanChangeBar> createState() => _SpanChangeBarState();
}

class _SpanChangeBarState extends State<SpanChangeBar> {
  final logic = Get.find<StatisticModuleLogic>();
  late double sliderLeft;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderLeft = logic.span / 3 * 237.w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.h)),
        child: Stack(children: [
          Positioned(
              left: sliderLeft,
              child: GestureDetector(
                  onPanUpdate: (e) {
                    setState(() {
                      double newSliderLeft = sliderLeft + e.delta.dx;
                      if (newSliderLeft <= 0) {
                        sliderLeft = 0;
                      } else if (newSliderLeft >= 158.w) {
                        sliderLeft = 158.w;
                      } else {
                        sliderLeft = newSliderLeft;
                      }
                    });
                  },
                  onPanEnd: (e) {
                    setState(() {
                      if ( sliderLeft <= 40.w) {
                        logic.changeSpan(0);
                      } else if (sliderLeft <= 120.w) {
                        logic.changeSpan(1);
                      } else {
                        logic.changeSpan(2);
                      }
                      sliderLeft = 79.w * logic.span;
                    });
                  },
                  child: Container(
                    width: 79.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                        color: Color(0xffE5E7FF),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.h),
                          topLeft: Radius.circular(5.h),
                          bottomLeft: Radius.circular(10.h),
                          bottomRight: Radius.circular(5.h),
                        )),
                  ))),
          IgnorePointer(
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.h)),
                width: 237.w,
                height: 29.h,
                child: Row(children: [
                  _span("周统计", 0),
                  _span("月统计", 1),
                  _span("年统计", 2)
                ])),
          )
        ]));
  }

  Widget _span(String label, int index) {
    return Container(
        width: 79.w,
        height: 29.h,
        child: Center(
            child: Text(label,
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold))));
  }
}
