import 'package:account_book/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerLeft extends StatelessWidget {
  const DrawerLeft({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Stack(children: [
          /// 头像
          Positioned(
              top: 140.h,
              left: 49.w,
              child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.USER_PANEL),
                  child: Container(
                      width: 75.h,
                      height: 75.h,
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle)))),
          Positioned(
              top: 240.h,
              left: 49.h,
              child: Container(width: 200.w, height: 30.h, color: Colors.grey)),
          Positioned(
              left: 49.w,
              top: 306.h,
              child: Container(
                  width: 195.w,
                  height: 398.h,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.CUSTOM_TAG),
                            child: _menuItem("自定义标签")),
                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.ACCOUNT_MANAGE),
                            child: _menuItem("账户管理")),
                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.INCENTIVE_PLAN),
                            child: _menuItem("激励计划")),
                        GestureDetector(
                            onTap: () => Get.toNamed(Routes.BUDGET_MANAGE),
                            child: _menuItem("预算管理")),
                        _menuItem("设置")
                      ]))),
          Positioned(
              left: 49.w,
              top: 819.h,
              child: Container(
                  width: 117.5.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23.5.h),
                      color: Colors.blue)))
        ]));
  }

  Widget _menuItem(String label) {
    return Container(
        width: 195.w,
        height: 58.h,
        color: Colors.grey.withOpacity(0.7),
        child: Center(child: Text(label)));
  }
}
