import 'package:get/get.dart';

class StatisticModuleLogic extends GetxController {
  /// 0:周统计 1:月统计 2:年统计
  int span = 1;

  void changeSpan(int newSpan){
    span = newSpan;
  }
}
