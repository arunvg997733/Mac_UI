import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macui/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.iconSize.value = controller.getIconSize(
      6,
      ScreenUtil().screenWidth,
    );

    controller.getLeft(6);
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: GetX<HomeController>(
        builder: (controller1) {
          return Stack(
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
                left: controller.posionlist.value[0],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
              IconWidget(
                left: controller.posionlist.value[1],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
              IconWidget(
                left: controller.posionlist.value[2],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
              IconWidget(
                left: controller.posionlist.value[3],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
              IconWidget(
                left: controller.posionlist.value[4],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
              IconWidget(
                left: controller.posionlist.value[5],
                top:
                    ScreenUtil().screenHeight -
                    controller.iconSize.value.h -
                    20.h,
              ),
            ],
          );
        },
      ),
    );
  }
}

class IconWidget extends GetView<HomeController> {
  const IconWidget({
    super.key,
    required this.left,
    required this.top,
    this.onPanUpdate,
    this.onPanEnd,
  });

  final double left;
  final double top;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      left: left,
      top: top,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: controller.iconSize.value.h,
          width: controller.iconSize.value.h,
          child: Image.asset("assets/images/settings.png"),
        ),
      ),
    );
  }
}
