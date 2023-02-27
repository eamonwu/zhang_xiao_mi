import 'package:get/get.dart';

import 'logic.dart';

class IncentivePlanModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncentivePlanModuleLogic());
  }
}
