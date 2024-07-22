

import 'package:flutter/material.dart';
import 'package:popular_people/core/routing/navigator.dart';


abstract class MediaQueryHelper {
  static double width =
      MediaQuery.of(AppRoutes.navigatorState.currentContext!).size.width;
  static double height =
      MediaQuery.of(AppRoutes.navigatorState.currentContext!).size.height;
}
