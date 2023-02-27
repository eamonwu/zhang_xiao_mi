import 'package:account_book/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppController extends GetxController {
  String currentPage = Routes.STATISTIC;

  // var _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;
static final safeAreaH = 1.sh-ScreenUtil().bottomBarHeight-ScreenUtil().statusBarHeight;
  bool  toStatistic() {
    if (currentPage == Routes.STATISTIC) return false;
    Get.toNamed(Routes.STATISTIC);
    currentPage=Routes.STATISTIC;
    return true;
  }
  bool toBook() {
    if (currentPage == Routes.BOOK) return false;
    Get.toNamed(Routes.BOOK);
    currentPage=Routes.BOOK;

    return true;
  }
}
