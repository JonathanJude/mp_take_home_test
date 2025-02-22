import 'package:flutter/material.dart';

extension ColorFilterConvenience on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}