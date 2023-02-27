import 'package:get/get.dart';

import 'logic.dart';

class CustomTagModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomTagModuleLogic());
  }
}
