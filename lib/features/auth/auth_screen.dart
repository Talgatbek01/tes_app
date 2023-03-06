import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app/features/auth/register/register_preview_page.dart';

import '../../core/styles/app_colors.dart';
import '../../shared_widgets/buttons/rounded_oulined_button.dart';
import '../../shared_widgets/user_social_account.dart';
import 'log_in/log_in_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainWhite,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/ocean.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Image.asset(
                    'assets/png/logo.png',
                    width: 206,
                    height: 54,
                  ),
                ),
              ),
              const Positioned(
                left: 16,
                bottom: 20,
                child: UserSocialAccount(
                  userName: 'Begimai Asanova',
                  userAccountName: 'begimai_asanova',
                  image: 'assets/images/user.jpg',
                  color: AppColors.mainWhite,
                ),
              ),
            ],
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 33,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: RoundedOutlinedButton(
                    text: 'LOG IN',
                    textColor: AppColors.mainBlack,
                    color: AppColors.mainWhite,
                    border: Border.all(width: 2, color: AppColors.mainBlack),
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const LogInPage(),
                      ),
                    ),
                  ),
                ),
                const Gap(9),
                Expanded(
                  child: RoundedOutlinedButton(
                    text: 'REGISTER',
                    textColor: AppColors.mainWhite,
                    color: AppColors.mainBlack,
                    onTap: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const RegisterPreviewPage(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
