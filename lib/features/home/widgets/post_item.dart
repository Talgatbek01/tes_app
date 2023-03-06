import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/styles/app_text_styles.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
    this.color,
    this.image,
  });

  final Color? color;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 343,
            height: 343,
            child: Image.network(
              '$image',
              fit: BoxFit.cover,
            ),
          ),
          const Gap(16),
          Row(
            children: [
              SizedBox(
                width: 28,
                height: 28,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    '$image',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Begimai Asanova',
                    style: AppTextStyles.userNameText.copyWith(
                      color: color,
                    ),
                  ),
                  Text(
                    '@begim_asanova',
                    style: AppTextStyles.userAccountText.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
