import 'package:account_book/app/global/widgets/bottom_navigation_bar.dart';
import 'package:account_book/app/global/widgets/drawer_left.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class BookModulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<BookModuleLogic>();

    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xffF5F5F5),
            body: Stack(
              children: [BottomNavBar()],
            ),
            drawer: DrawerLeft(),
            appBar: AppBar(),
          )),
    );
  }
}
