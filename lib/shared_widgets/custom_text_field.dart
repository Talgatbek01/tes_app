import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.prefixText,
    this.visibleSuffixIcon,
    this.invisibleSuffixIcon,
    this.controller,
    this.validator,
    this.onChanged,
  });

  final String? hintText;
  final bool? obscureText;
  final String? prefixText;
  final Widget? visibleSuffixIcon;
  final Widget? invisibleSuffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText != false,
        keyboardType: TextInputType.emailAddress,
        cursorColor: AppColors.hoverCursorText,
        cursorRadius: const Radius.circular(5),
        cursorHeight: 20,
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: AppTextStyles.hintText,
          prefixText: prefixText,
          errorMaxLines: 2,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 17,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.hoverCursorText,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.mainBlack,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
