import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:guildo/themes/volcano_theme.dart';

class VolcanoShimmer extends StatelessWidget {

  final Widget child;
  final List<Color>? colors;
  final EdgeInsetsGeometry? padding;

  const VolcanoShimmer({
    super.key,
    required this.child,
    this.colors,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: colors ?? [
          VolcanoTheme.colorScheme.primary.withOpacity(0.5),
          VolcanoTheme.colorScheme.primary.withOpacity(0.1),
        ]
      ),
      child: child,
    );
  }
}
