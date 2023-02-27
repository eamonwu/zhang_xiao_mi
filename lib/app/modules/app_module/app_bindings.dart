import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:account_book/app/modules/asr_module/logic.dart';
import 'package:account_book/app/modules/statistic_module/binding.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => ASRModuleLogic());
    Get.lazyPut(() => StatisticModuleBinding());
  }
}