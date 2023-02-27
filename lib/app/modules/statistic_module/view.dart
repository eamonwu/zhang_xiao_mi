import 'package:account_book/app/global/widgets/avatar_box.dart';
import 'package:account_book/app/global/widgets/drawer_left.dart';
import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:account_book/app/modules/statistic_module/local_widgets/month_change_bar.dart';
import 'package:account_book/app/modules/statistic_module/local_widgets/overview_box.dart';
import 'package:account_book/app/modules/statistic_module/local_widgets/pie_chart.dart';
import 'package:account_book/app/modules/statistic_module/local_widgets/span_change_bar.dart';
import 'package:account_book/app/modules/statistic_module/local_widgets/trend_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../global/widgets/bottom_navigation_bar.dart';
import 'logic.dart';

class StatisticModulePage extends StatelessWidget {
  const StatisticModulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StatisticModuleLogic>();

    return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.grey.withOpacity(0.3),
                body: Stack(alignment: Alignment.center, children: [
                  /// 滚动主体部分
                  Positioned(
                      top: 272.h,
                      child: Container(
                          width: 1.sw,
                          height: AppController.safeAreaH - 272.h,
                          child: SingleChildScrollView(
                              child: Column(children: [
                            TrendChart(),
                            PieChart(),
                            SizedBox(height: 155.h)
                          ])))),

                  /// 黑色数据总览框
                  Positioned(top: 154.h, child: OverviewBox()),
                  Positioned(top: 107.h, child: MonthChangeBar()),
                  Positioned(top: 76.h, left: 161.w, child: SpanChangeBar()),
                  Positioned(left: 40.w, top: 29.h, child: AvatarBox()),
                  BottomNavBar(),
                ]),
                drawer: DrawerLeft())));
  }
}
