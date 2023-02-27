import 'package:get/get.dart';

import 'logic.dart';

class UserPanelModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPanelModuleLogic());
  }
}
