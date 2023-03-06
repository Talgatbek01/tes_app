import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:test_app/features/home/widgets/post_item.dart';

import '../../core/styles/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> rowList = [
    ...List.generate(
      10,
      (index) => PostItem(
        image: 'https://source.unsplash.com/random?sig=$index',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text('Register', style: AppTextStyles.pageNameText),
                      const Gap(32),
                      Text('WHAT’S NEW TODAY', style: AppTextStyles.titleText),
                    ],
                  ),
                ),
                const Gap(24),
                SizedBox(
                  height: 387,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: rowList.length,
                    itemBuilder: (context, index) =>
                        rowList[index % rowList.length],
                  ),
                ),
                const Gap(48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('BROWSE ALL', style: AppTextStyles.titleText),
                ),
                const Gap(48),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  child: MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Image.network(
                      'https://source.unsplash.com/random?sig=$index',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
