import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarBox extends StatelessWidget {
  const AvatarBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Scaffold.of(context).openDrawer(),
      child: Container(
          width: 50.h,
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.h), color: Colors.white),
          child: Center(
              child: Container(
                  width: 35.h,
                  height: 35.h,
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                  child: Align(
                      alignment: const Alignment(-0.3, -0.3),
                      child: Container(
                          width: 23.h,
                          height: 23.h,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white)))))),
    );
  }
}
