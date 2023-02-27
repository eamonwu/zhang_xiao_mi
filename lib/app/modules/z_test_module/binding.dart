import 'package:get/get.dart';

import 'logic.dart';

class ZTestModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ZTestModuleLogic());
  }
}
