import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get width => screenSize.width;
  double get height => screenSize.height;

  double get lowPadding => width * 0.02;
  double get mediumPadding => width * 0.045;
  double get largePadding => width * 0.075;

  double get smallText => width * 0.04;
  double get mediumText => width * 0.05;
  double get largeText => width * 0.09;
}
