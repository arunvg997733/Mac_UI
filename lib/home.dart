import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macui/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.iconSize = 40.0.obs;
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height: controller.iconSize.value.h + 20.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(15.h),
                ),
              ),
            ),
          ),

          IconWidget(
            left: 20.h,
            top: ScreenUtil().screenHeight - controller.iconSize.value.h - 20.h,
          ),
          IconWidget(
            left: 70.h,
            top: ScreenUtil().screenHeight - controller.iconSize.value.h - 20.h,
          ),
          IconWidget(
            left: 120.h,
            top: ScreenUtil().screenHeight - controller.iconSize.value.h - 20.h,
          ),
          IconWidget(
            left: 170.h,
            top: ScreenUtil().screenHeight - controller.iconSize.value.h - 20.h,
          ),
          IconWidget(
            left: 220.h,
            top: ScreenUtil().screenHeight - controller.iconSize.value.h - 20.h,
          ),
        ],
      ),
    );
  }
}

class IconWidget extends GetView<HomeController> {
  const IconWidget({super.key, required this.left, required this.top});

  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: left,
      top: top,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: controller.iconSize.value.h,
        width: controller.iconSize.value.h,
        child: Image.asset("assets/images/settings.png"),
      ),
    );
  }
}
