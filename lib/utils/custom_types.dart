import 'package:flutter/material.dart';

typedef Json = Map<String, dynamic>;

extension VolcanoWidgetExt on Widget {
  Widget marginSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) => Container(
    margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: this
  );

  Widget withMarginOnly({
    double left = 0, double right = 0,
    double top = 0, double bottom = 0,
  }) => Container(
    margin: EdgeInsets.only(
      left: left, right: right,
      top: top, bottom: bottom
    ),
    child: this
  );

}