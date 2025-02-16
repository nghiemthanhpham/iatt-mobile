import 'package:flutter/material.dart';
import './app_colors.dart';

class AppTheme {
  
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: "Pretendard",
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: "Pretendard",
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
      );
}
