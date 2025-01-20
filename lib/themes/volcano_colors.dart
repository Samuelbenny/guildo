import 'package:flutter/material.dart';

sealed class VolcanoColors {
  // Existing base colors
  // Primary background in light mode, used for clean, minimal surfaces
  static const Color white = Color(0xFFFFFFFF);
  // Primary background in dark mode, deep dark foundation
  static const Color dark = Color(0xFF111111);
  // Light card backgrounds, subtle elevation effect
  static const Color cardLight = Color(0xFFF5F5F5);
  // Dark bottom sheets, modal backgrounds
  static const Color bottomSheetDark = Color(0xFF0C0B10);
  // Dark purple-tinted card backgrounds
  static const Color cardPurpleDark = Color(0xFF16121C);
  // Neutral dark card backgrounds
  static const Color cardNeutralDark = Color(0xFF110E13);
}