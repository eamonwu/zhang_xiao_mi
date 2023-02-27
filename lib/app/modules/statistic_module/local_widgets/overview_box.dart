import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewBox extends StatelessWidget {
  const OverviewBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 367.w,
        height: 102.h,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.h),
              topLeft: Radius.circular(30.h),
              bottomLeft: Radius.circular(10.h),
              bottomRight: Radius.circular(30.h),
            )),
        child: Center(
            child: Container(
                width: 296.w,
                height: 49.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _dataCell("支出", 20.00),
                      _dataCell("收入", 50.00),
                      _dataCell("结余", 30.00),
                    ]))));
  }

  Widget _dataCell(String label, double val) {
    return Container(
        width: 76.w,
        height: 49.h,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(val.toString(),
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text("$label (元)",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white))
            ]));
  }
}
