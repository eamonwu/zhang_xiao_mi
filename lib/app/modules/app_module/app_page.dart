import 'package:account_book/app/modules/app_module/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class AppPage extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AccountBook Page')),
      body: Container(
        // child: Obx(()=>Container(child: Text(controller.obj),)),
      ),
    );
  }
}
