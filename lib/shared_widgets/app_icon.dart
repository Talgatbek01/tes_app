import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  back,
  visible,
  invisible,
  home,
  search,
  add,
  plus,
  chat,
  user,
}

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    Key? key,
    this.size = 20,
    this.color,
    this.originalColor = false,
  }) : super(key: key);

  final AppIcons icon;
  final double size;
  final Color? color;
  final bool originalColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: SvgPicture.asset(
          'assets/svg/${icon.name}.svg',
          // ignore: deprecated_member_use
          color: originalColor ? null : color ?? IconTheme.of(context).color,
          height: size,
          width: size,
        ),
      ),
    );
  }
}
