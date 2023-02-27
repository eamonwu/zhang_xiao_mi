import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class HeadBar extends StatelessWidget {
  const HeadBar({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        width: 428.w,
        height: 114.h,
        color: Colors.grey.withOpacity(0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 32.w,
                top: 39.h,
                child: GestureDetector(
                  onTap: ()=>Get.back(),
                  child: Container(
                      width: 65.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.h)),
                      child: Center(
                          child: Image(
                              width: 35.h,
                              height: 35.h,
                              image: Svg("assets/svg/undo.svg")))),
                )),
            Positioned(
                child: Text(
              label,
              style: TextStyle(
                  fontSize: 20.sp, fontWeight: FontWeight.bold, letterSpacing: 3),
            ))
          ]
        )
      ),
    );
  }
}
