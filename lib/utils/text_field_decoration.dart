import 'package:flutter/material.dart';

import '../commons/colors.dart';

InputDecoration inputDecoration({required String hintText}) => InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF4E4E4E), fontSize: 16),
      contentPadding:
          const EdgeInsets.only(right: 15, left: 25, top: 2, bottom: 2),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
    );
InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
      contentPadding:
          const EdgeInsets.only(right: 15, left: 25, top: 2, bottom: 2),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.primary)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
    );

InputDecoration inputDecorationSearch(
        {required String hintText,
        required VoidCallback onPressed,
        Color borderColor = Colors.white}) =>
    InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: borderColor, fontSize: 16),
      suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.cancel,
            color: borderColor,
          )),
      contentPadding:
          const EdgeInsets.only(right: 15, left: 25, top: 2, bottom: 2),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: borderColor)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppColors.redClr)),
    );
