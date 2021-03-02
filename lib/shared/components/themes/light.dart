import 'package:flutter/material.dart';
import 'package:store_demo_app/shared/components/color/colors.dart';

ThemeData lightTheme() => ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: kPaleLilac(),
      primaryColor: kPaleLilac(),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: kPaleLilac(),
      ),
      textTheme: TextTheme(),
    );
