import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  RxDouble iconSize = 50.0.obs;

  Rx<List<double>> posionlist = Rx([]);

  getLeft(int length) {
    for (int i = 0; i < length; i++) {
      if (i == 0) {
        posionlist.value.add(20);
      } else {
        double a = 20.h + (iconSize.value.h * i);
        posionlist.value.add(a);
      }
    }
    print(posionlist);
  }

  // getIconSize(int length, double screenWidth) {

  // }

  double getIconSize(int length, double screenWidth) {
    print("Icon size ------------- ${screenWidth} ");
    if (length <= 0) return 0;

    double totalSpacing = (length * 20.h) + 20.h;
    double availableWidth = screenWidth - totalSpacing;
    double iconWidth = availableWidth / length;

    return iconWidth; // or .round() if you prefer
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class HomeController extends GetxController {
//   RxDouble iconWidth = 0.0.obs;
//   List list = [1, 2, 3, 4, 5, 6];

//   Offset previousPostion = Offset(0, 0);

//   bool isMovable = false;
//   int selectedIndex = 0;

//   bool isOver = false;

//   getIconSize() {
//     print(
//       "screen widget ========= lenth = ${positionList.length}  ${ScreenUtil().screenWidth}",
//     );

//     if (positionList.length < 6) {
//       iconWidth.value = 50.w;
//     } else {
//       iconWidth.value = ScreenUtil().screenWidth / positionList.length - 20.w;
//     }
//   }

//   List<Offset> positionList = [
//     Offset(0, 600),
//     Offset(60, 600),
//     Offset(120, 600),
//     Offset(180, 600),
//     Offset(240, 600),
//     Offset(300, 600),
//   ];

//   Rx<Offset> point1 = Rx(Offset(0, 600));
//   Rx<Offset> point2 = Rx(Offset(60, 600));
//   Rx<Offset> point3 = Rx(Offset(120, 600));

//   Rx<String> opoint1 = Rx("A");
//   Rx<String> opoint2 = Rx("B");
//   Rx<String> opoint3 = Rx("C");

//   move(Offset value, int index) {
//     selectedIndex = index;
//     isMovable = true;

//     positionList[index] += value;
//     if (positionList[index].dy > 600) {
//       isOver = true;
//     } else {
//       isOver = false;
//     }
//     print("working ---- = ${positionList[index]}");
//     update();
//   }

//   moveSingle(Offset value, Rx<Offset> point, int count) {
//     isMovable = true;

//     point.value += value;
//     if (point.value.dy > 600) {
//       if (count == 1) {
//         if (point.value.dx > 0 && point.value.dx < 70) {
//           point2.value = Offset(60, 600);
//           point3.value = Offset(120, 600);
//         } else if (point.value.dx > 70 && point.value.dx < 120) {
//           print("working ----dsduah = ${point.value}");
//           point2.value = Offset(0, 600);
//           point3.value = Offset(120, 600);
//         }
//         //  else if (point.value.dx > 80 && point.value.dx < 120) {
//         //   print("working ----dsduah = ${point.value}");
//         //   point2.value = Offset(0, 600);
//         //   point3.value = Offset(120, 600);
//         // }
//         else if (point.value.dx > 120) {
//           print("working ----dsduah = ${point.value}");
//           point2.value = Offset(0, 600);
//           point3.value = Offset(70, 600);
//         }
//       } else if (count == 2) {
//         if (point.value.dx > 0 && point.value.dx < 70) {
//           point1.value = Offset(60, 600);
//           point3.value = Offset(120, 600);
//         } else if (point.value.dx > 80 && point.value.dx < 120) {
//           print("working ----dsduah = ${point.value}");
//           point1.value = Offset(0, 600);
//           point3.value = Offset(120, 600);
//         }
//         //  else if (point.value.dx > 80 && point.value.dx < 120) {
//         //   print("working ----dsduah = ${point.value}");
//         //   point1.value = Offset(0, 600);
//         //   point3.value = Offset(120, 600);
//         // }
//         else if (point.value.dx > 120) {
//           print("working ----dsduah = ${point.value}");
//           point1.value = Offset(0, 600);
//           point3.value = Offset(70, 600);
//         }
//       } else if (count == 3) {
//         if (point.value.dx > 0 && point.value.dx < 70) {
//           point1.value = Offset(60, 600);
//           point2.value = Offset(120, 600);
//         } else if (point.value.dx > 70 && point.value.dx < 120) {
//           print("working ----dsduah = ${point.value}");
//           point1.value = Offset(0, 600);
//           point2.value = Offset(120, 600);
//         }
//         // else if (point.value.dx > 80 && point.value.dx < 120) {
//         //   print("working ----dsduah = ${point.value}");
//         //   point1.value = Offset(0, 600);
//         //   point2.value = Offset(120, 600);
//         // }
//         else if (point.value.dx > 120) {
//           print("working ----dsduah = ${point.value}");
//           point1.value = Offset(0, 600);
//           point2.value = Offset(70, 600);
//         }
//       }
//       isOver = true;
//     } else {
//       isOver = false;
//       if (count == 1) {
//         point2.value = Offset(10, 600);
//         point3.value = Offset(80, 600);
//       } else if (count == 2) {
//         point1.value = Offset(10, 600);
//         point3.value = Offset(80, 600);
//       } else {
//         point1.value = Offset(10, 600);
//         point2.value = Offset(80, 600);
//       }
//     }

//     print("working ---- = ${point.value}");

//     update();
//   }

//   moveToPrevious(Offset value, int count) {
//     if (value.dy > 600) {
//       if (count == 1) {
//         if (value.dx > 0 && value.dx < 70) {
//           print("switch ------------ woprking        2");
//           final otemp = opoint1;
//           opoint1 = opoint2;
//           opoint2 = otemp;
//           final temp = point1;
//           point1.value = Offset(0, 600);
//           point2.value = Offset(60, 600);
//           point3.value = Offset(120, 600);
//         } else if (value.dx > 70 && value.dx < 120) {
//           final temp = opoint1;
//           opoint1 = opoint3;
//           opoint3 = temp;

//           point1.value = Offset(60, 600);
//           point2.value = Offset(0, 600);
//           point3.value = Offset(120, 600);

//           print("switch ------------ woprking        3");
//         } else if (value.dx > 120) {
//           final temp = opoint1;
//           opoint1 = opoint3;
//           opoint3 = temp;

//           point1.value = Offset(120, 600);
//           point2.value = Offset(0, 600);
//           point3.value = Offset(60, 600);

//           print("switch ------------ woprking        3");
//         } else {
//           point1.value = Offset(0, 600);
//           point2.value = Offset(60, 600);
//           point3.value = Offset(120, 600);
//         }
//       } else if (count == 2) {
//         if (value.dx > 0 && value.dx < 70) {
//           print("switch ------------ woprking        2");
//           final otemp = opoint2;
//           opoint1 = opoint2;
//           opoint2 = otemp;
//           final temp = point1;
//           point1.value = Offset(60, 600);
//           point2.value = Offset(0, 600);
//           point3.value = Offset(120, 600);
//         } else if (value.dx > 70 && value.dx < 120) {
//           final temp = opoint1;
//           opoint1 = opoint3;
//           opoint3 = temp;

//           point1.value = Offset(60, 600);
//           point2.value = Offset(0, 600);
//           point3.value = Offset(120, 600);

//           print("switch ------------ woprking        3");
//         } else if (value.dx > 120) {
//           final temp = opoint1;
//           opoint1 = opoint3;
//           opoint3 = temp;

//           point1.value = Offset(120, 600);
//           point2.value = Offset(0, 600);
//           point3.value = Offset(60, 600);

//           print("switch ------------ woprking        3");
//         } else {
//           point1.value = Offset(0, 600);
//           point2.value = Offset(60, 600);
//           point3.value = Offset(120, 600);
//         }
//       } else {
//         point1.value = Offset(0, 600);
//         point2.value = Offset(60, 600);
//         point3.value = Offset(120, 600);
//       }
//     } else {
//       point1.value = Offset(0, 600);
//       point2.value = Offset(60, 600);
//       point3.value = Offset(120, 600);
//     }
//   }

//   // moveToPrevious(int index) {
//   //   print("working ------------ end  = pre = ${previousPostion}");
//   //   if (index == 0) {
//   //     positionList[index] = Offset(0, 600);
//   //   } else if (index == 1) {
//   //     positionList[index] = Offset(60, 600);
//   //   } else if (index == 2) {
//   //     positionList[index] = Offset(120, 600);
//   //   } else if (index == 3) {
//   //     positionList[index] = Offset(180, 600);
//   //   } else if (index == 4) {
//   //     positionList[index] = Offset(240, 600);
//   //   } else if (index == 5) {
//   //     positionList[index] = Offset(300, 600);
//   //   }
//   //   isMovable = false;
//   //   update();
//   // }

//   double getLeftPosition(int index, Offset position, int testIndex) {
//     print("working ------------ position = ${position}");

//     final currentIndex = getCurrentIndex(position);

//     print("working ------------ position = ${currentIndex}");

//     if (isOver) {
//       if (testIndex > 3) {
//         return position.dx - 30;
//       } else {
//         // return 0;
//         return position.dx;
//       }
//     } else {
//       if (index < selectedIndex) {
//         return position.dx + 30;
//       }
//       return (60 * index.toDouble() - 30);
//     }
//   }

//   int getCurrentIndex(Offset position) {
//     if (position.dx > 0 && position.dx < 60) {
//       return 0;
//     } else if (position.dx > 60 && position.dx < 120) {
//       return 1;
//     } else if (position.dx > 120 && position.dx < 180) {
//       return 2;
//     } else if (position.dx > 180 && position.dx < 240) {
//       return 3;
//     } else if (position.dx > 240 && position.dx < 300) {
//       return 4;
//     } else if (position.dx > 300) {
//       return 5;
//     } else {
//       return 3;
//     }
//   }
// }

