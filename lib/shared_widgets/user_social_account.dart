import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../core/styles/app_text_styles.dart';

class UserSocialAccount extends StatelessWidget {
  const UserSocialAccount({
    super.key,
    this.image,
    this.color,
    required this.userAccountName,
    required this.userName,
  });

  final String? image;
  final String userName;
  final String userAccountName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              image.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: AppTextStyles.userNameText.copyWith(
                color: color,
              ),
            ),
            Text(
              '@$userAccountName',
              style: AppTextStyles.userAccountText.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
