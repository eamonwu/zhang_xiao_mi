import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global/widgets/head_bar.dart';
import 'logic.dart';

class IncentivePlanModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<IncentivePlanModuleLogic>();
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: const [HeadBar(label: "激励计划")],
          ),
        ),
      ),
    );
  }
}
