import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthChangeBar extends StatelessWidget {
  MonthChangeBar({Key? key}) : super(key: key);

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    List data = ["本月", "上月", "12月", "11月", "10月", "9月"];

    return Container(
        // color: Colors.white,
        width: 367.w,
        height: 47.h,
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (int i = 0; i < data.length; i++)
                GestureDetector(
                  onTap: () => curIndex = i,
                  child: Container(
                      width: 89.w,
                      height: 47.h,
                      child: Center(
                          child: Text(
                        data[i],
                        style: TextStyle(
                            fontWeight: curIndex == i ? FontWeight.w900 : FontWeight.w500,
                            fontSize: 14.sp),
                      ))),
                )
            ])));
  }
}
