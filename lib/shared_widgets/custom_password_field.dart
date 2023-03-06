import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import '../core/styles/app_text_styles.dart';
import 'app_icon.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    this.hintText,
    this.visibleSuffixIcon,
    this.invisibleSuffixIcon,
    this.controller,
    this.validator,
  });

  final String? hintText;

  final Widget? visibleSuffixIcon;
  final Widget? invisibleSuffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        validator: widget.validator,
        obscureText: obscureText,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.hoverCursorText,
        cursorRadius: const Radius.circular(5),
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          hintStyle: AppTextStyles.hintText,
          errorMaxLines: 3,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                color: Colors.transparent,
                margin: const EdgeInsets.all(11),
                child: obscureText
                    ? const AppIcon(
                        AppIcons.invisible,
                        color: AppColors.mainBlack,
                      )
                    : const AppIcon(
                        AppIcons.visible,
                        color: AppColors.mainBlack,
                      ),
              ),
            ),
          ),
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
