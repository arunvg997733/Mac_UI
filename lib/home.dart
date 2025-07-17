import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:macui/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});
  // int count = 5;

  @override
  Widget build(BuildContext context) {
    controller.iconcount.value = 5;
    controller.iconSize.value = controller.getIconSize(
      controller.iconcount.value,
      ScreenUtil().screenWidth,
    );

    controller.getLeft(controller.iconcount.value);
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: GetX<HomeController>(
          builder: (controller1) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      height: controller.iconSize.value + 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(15.h),
                      ),
                    ),
                  ),
                ),

                Stack(
                  children: List.generate(controller.iconcount.value, (index) {
                    return IconWidget(
                      onPanUpdate: (details) {
                        print("kjdshfudhsufh -- ${details.delta.dx}");
                        controller.posionlist.value[index] += details.delta;
                        controller.iconSize.value = controller.getIconSize(
                          controller.iconcount.value - 1,
                          ScreenUtil().screenWidth,
                        );
                        controller.getMovingLeft(
                          controller.iconcount.value,
                          index,
                          controller.posionlist.value[index],
                        );

                        controller.posionlist.refresh();
                      },
                      onPanEnd: (p0) {
                        controller.iconSize.value = controller.getIconSize(
                          controller.iconcount.value,
                          ScreenUtil().screenWidth,
                        );
                        controller.getLeft(controller.iconcount.value);
                        int hoverValue = controller.getSegmentIndex(
                          p0.globalPosition.dx,
                          360,
                          controller.iconcount.value,
                        );
                        hoverValue--;

                        final positionTemp = controller.posionlist.value[index];

                        controller1.posionlist.value[index] =
                            controller.posionlist.value[hoverValue];

                        controller.posionlist.value[hoverValue] = positionTemp;
                      },
                      left: controller.posionlist.value[index].dx,
                      top: controller.posionlist.value[index].dy,
                      index,
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class IconWidget extends GetView<HomeController> {
  const IconWidget(
    this.index, {
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
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 150),
      left: left,
      top: top,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          height: controller.iconSize.value,
          width: controller.iconSize.value,
          // color: Colors.amber,
          child: Image.asset(
            "assets/images/${controller.listNUmber[index]}.png",
          ),
          // child: Center(child: Text(controller.listNUmber[index].toString())),
        ),
      ),
    );
  }
}
