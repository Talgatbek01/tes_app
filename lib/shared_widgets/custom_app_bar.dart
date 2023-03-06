import 'package:flutter/material.dart';

import '../core/styles/app_colors.dart';
import 'app_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.implyLeading = true,
    this.actions,
  });

  final bool implyLeading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainWhite,
      elevation: 0,
      leading: implyLeading
          ? Row(
              children: [
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const AppIcon(
                    AppIcons.back,
                    color: AppColors.mainBlack,
                  ),
                ),
              ],
            )
          : null,
      actions: [if (actions != null) Row(children: actions!)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
