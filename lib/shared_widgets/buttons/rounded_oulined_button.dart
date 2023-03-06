import 'package:flutter/material.dart';

import '../../core/styles/app_text_styles.dart';

class RoundedOutlinedButton extends StatelessWidget {
  const RoundedOutlinedButton({
    super.key,
    this.color,
    this.textColor,
    this.border,
    required this.text,
    required this.onTap,
  });

  final Color? color;
  final Color? textColor;
  final String text;
  final Function() onTap;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.buttonText.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
