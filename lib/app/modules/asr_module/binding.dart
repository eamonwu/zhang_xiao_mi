import 'package:get/get.dart';

import 'logic.dart';

class ASRModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ASRModuleLogic());
  }
}
