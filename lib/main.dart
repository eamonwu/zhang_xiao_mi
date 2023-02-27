import 'package:account_book/app/modules/app_module/app_bindings.dart';
import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:account_book/app/modules/asr_module/logic.dart';
import 'package:account_book/app/modules/statistic_module/binding.dart';
import 'package:account_book/app/modules/statistic_module/logic.dart';
import 'package:account_book/app/modules/statistic_module/view.dart';
import 'package:account_book/app/modules/z_test_module/logic.dart';
import 'package:account_book/app/modules/z_test_module/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() {
  Get.put(AppController());
  Get.put(StatisticModuleLogic());
  Get.put(ZTestModuleLogic());
  runApp(ScreenUtilInit(
    designSize: const Size(428, 926),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        // home: StatisticModulePage(),
        home: StatisticModulePage(),
        initialRoute: '/',
        initialBinding: AppBinding(),
        theme: appThemeData,
        defaultTransition: Transition.fade,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
      );
    },
  ));
}
