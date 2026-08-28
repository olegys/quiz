import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  const AppThemes._();

  static final ThemeData dark = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: AppColors.backgroundTwo,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.accentOne,
    ),
  );
}
