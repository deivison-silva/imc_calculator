import 'package:flutter/material.dart';
import './app_colors.dart';

class TextStyles {
  static final TextStyle white20 = TextStyle(
    fontSize: 20.0,
    color: AppColors.white,
  );

  static final TextStyle black16 = TextStyle(
    fontSize: 16.0,
    color: AppColors.black.withOpacity(0.54),
  );

  static final TextStyle black20Italic = TextStyle(
    fontSize: 20.0,
    fontStyle: FontStyle.italic,
    color: AppColors.black.withOpacity(0.54),
  );
}
