import 'package:get/get.dart';

import 'logic.dart';

class AccountManageModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountManageModuleLogic());
  }
}
