import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tisteps_task/core/constants/app_constants.dart';

class Helper {
  /// Get image picture path
  static String getImagePath(String name) {
    return "$imagePath$name";
  }

  /// Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }
}
