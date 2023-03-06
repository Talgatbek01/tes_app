import 'package:flutter/material.dart';
import 'package:test_app/features/auth/register/register_page.dart';

import '../../../shared_widgets/custom_app_bar.dart';
import 'create_nickname.dart';

class RegisterPreviewPage extends StatefulWidget {
  const RegisterPreviewPage({Key? key}) : super(key: key);

  @override
  State<RegisterPreviewPage> createState() => _RegisterPreviewPageState();
}

class _RegisterPreviewPageState extends State<RegisterPreviewPage> {
  PageController? controller;
  int currentPage = 0;

  void _nextPage() {
    controller?.animateToPage(
      1,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 600),
    );
  }

  void _previousPage() {
    controller?.animateToPage(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    currentPage = 0;
    super.dispose();
  }

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (int page) {
          currentPage = page + 1;
        },
        children: [
          RegisterPage(
            nextPage: () => _nextPage(),
          ),
          CreateNickNamePage(
            prevPage: () => _previousPage(),
          ),
        ],
      ),
    );
  }
}
