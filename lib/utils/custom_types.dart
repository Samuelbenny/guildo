import 'package:flutter/material.dart';

typedef Json = Map<String, dynamic>;

extension VolcanoWidgetExt on Widget {
  /// Adds symmetric margin to a widget.
  ///
  /// Parameters:
  /// - [vertical]: The vertical margin to apply. Defaults to 0.
  /// - [horizontal]: The horizontal margin to apply. Defaults to 0.
  Widget marginSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) => Container(
    margin: EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    ),
    child: this,
  );

  /// Adds specific margins to each side of a widget.
  ///
  /// Parameters:
  /// - [left]: The left margin to apply. Defaults to 0.
  /// - [right]: The right margin to apply. Defaults to 0.
  /// - [top]: The top margin to apply. Defaults to 0.
  /// - [bottom]: The bottom margin to apply. Defaults to 0.
  Widget withMarginOnly({
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) => Container(
    margin: EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    ),
    child: this,
  );
}