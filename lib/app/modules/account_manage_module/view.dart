import 'package:account_book/app/global/widgets/head_bar.dart';
import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AccountManageModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<AccountManageModuleLogic>();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.6),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              const HeadBar(label: "账号管理"),
              Positioned(
                  top: 114.h,
                  child: Container(
                    width: 1.sw,
                    height: AppController.safeAreaH- 114.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _emailBindingBox(),
                          _phoneBindingBox(),
                          _otherOptBox("绑定微信"),
                          _otherOptBox("切换账号"),
                          _otherOptBox("注销账号"),
                          _logoutBtn(),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  /// 绑定邮箱选项
  Widget _emailBindingBox() {
    return Container(
      width: 364.w,
      height: 120.h,
      margin: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.h),
      ),
      child: Row(
        children: [
          SizedBox(width: 45.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("绑定邮箱",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 18.sp)),
              SizedBox(height: 10.h),
              Text("12345678@gmail.com",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16.sp,
                      color: Colors.black.withOpacity(0.7)))
            ],
          ),
          Expanded(child: Container()),
          Container(
            width: 65.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20.h)),
            child: Image(
                width: 25.h,
                height: 25.h,
                image: Svg("assets/svg/chevron-right.svg")),
          ),
          SizedBox(width: 45.w),
        ],
      ),
    );
  }

  /// 绑定手机号选项
  Widget _phoneBindingBox() {
    return Container(
      width: 364.w,
      height: 120.h,
      margin: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18.h),
      ),
      child: Row(
        children: [
          SizedBox(width: 45.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("绑定手机号",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 18.sp,
                      color: Colors.white)),
              SizedBox(height: 10.h),
              Text("13328388871",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16.sp,
                      color: Colors.white.withOpacity(0.7)))
            ],
          ),
          Expanded(child: Container()),
          Container(
            width: 65.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.h)),
            child: Image(
                width: 25.h,
                height: 25.h,
                image: Svg("assets/svg/chevron-right.svg")),
          ),
          SizedBox(width: 45.w),
        ],
      ),
    );
  }

  /// 其他选项 14
  Widget _otherOptBox(String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.h),
      width: 364.w,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.h),
      ),
      child: Row(
        children: [
          SizedBox(width: 45.w),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(label),
            Container(
                width: 65.w,
                height: 45.h,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.h)),
                child: Image(
                    width: 25.h,
                    height: 25.h,
                    image: Svg("assets/svg/chevron-right.svg")))
          ]),
          Expanded(child: Container()),
          Container(
            width: 100.h,
            height: 100.h,
            color: Colors.grey,
            child: Center(
              child: Text("插画"),
            ),
          ),
          SizedBox(width: 45.w),
        ],
      ),
    );
  }

  /// 退出登录
  Widget _logoutBtn() {
    return Container(
      width: 364.w,
      height: 72.h,
      margin: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.h),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          "退出登录",
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
