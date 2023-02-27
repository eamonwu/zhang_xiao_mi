import 'package:get/get.dart';

import 'logic.dart';

class StatisticModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticModuleLogic());
  }
}
