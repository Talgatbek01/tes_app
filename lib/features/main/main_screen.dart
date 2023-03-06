import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/utils/app_route.dart';
import '../../shared_widgets/app_icon.dart';
import '../add/add_page.dart';
import '../chat/chat_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../search/search_page.dart';

class BottomBarItemValue {
  final AppIcons icon;
  final AppIcons selectedIcon;

  BottomBarItemValue({
    required this.selectedIcon,
    required this.icon,
  });
}

class MainScreen extends StatefulWidget {
  static const route = AppRoute('/');

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = PersistentTabController();

  late final _items = [
    BottomBarItemValue(icon: AppIcons.home, selectedIcon: AppIcons.home),
    BottomBarItemValue(icon: AppIcons.search, selectedIcon: AppIcons.search),
    BottomBarItemValue(icon: AppIcons.plus, selectedIcon: AppIcons.plus),
    BottomBarItemValue(icon: AppIcons.chat, selectedIcon: AppIcons.chat),
    BottomBarItemValue(icon: AppIcons.user, selectedIcon: AppIcons.user),
  ];
  @override
  Widget build(BuildContext context) {
    final index = controller.index;
    return PersistentTabView(
      context,
      controller: controller,
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style6,
      backgroundColor: AppColors.mainWhite,
      onItemSelected: (index) {
        setState(() {});
      },
      decoration: NavBarDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: AppColors.mainBlack.withOpacity(0.3),
          ),
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
      ),
      screens: const [
        HomePage(),
        SearchPage(),
        AddPage(),
        ChatPage(),
        ProfilePage()
      ],
      items: _items
          .asMap()
          .entries
          .map(
            (e) => PersistentBottomNavBarItem(
              icon: AppIcon(
                index == e.key ? e.value.selectedIcon : e.value.icon,
                color: index == e.key
                    ? AppColors.hoverCursorText
                    : AppColors.mainBlack,
                size: 20,
              ),
              activeColorPrimary: AppColors.hoverCursorText,
              activeColorSecondary: AppColors.mainWhite,
            ),
          )
          .toList(),
    );
  }
}
