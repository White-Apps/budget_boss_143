import 'package:budget_boss_143/core/bb_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BBField extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final Color borderColor;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const BBField({
    super.key,
    required this.hintText,
    required this.maxLine,
    this.textInputType,
    required this.borderColor,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLines: maxLine,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 48.h,
        fontWeight: FontWeight.w400,
        color: BBColors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 48.h,
          fontWeight: FontWeight.w400,
          color: BBColors.white.withOpacity(0.6),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: borderColor)),
      ),
    );
  }
}
