import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../shared_widgets/buttons/rounded_oulined_button.dart';
import '../../../shared_widgets/custom_app_bar.dart';
import '../../../shared_widgets/custom_password_field.dart';
import '../../../shared_widgets/custom_text_field.dart';
import '../../main/main_screen.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool validateEmail(String? value) => RegExp(
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])',
      ).hasMatch(value ?? '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainWhite,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Log In', style: AppTextStyles.pageNameText),
              const Gap(32),
              CustomTextField(
                hintText: 'jane@gmail.com',
                controller: loginTextController,
                validator: (value) {
                  if (value == null || value.isEmpty && value.length < 2) {
                    return 'Please enter a valid email';
                  }
                  if (validateEmail(value)) {
                    return null;
                  }
                  return 'Write the correct email address';
                },
              ),
              const Gap(16),
              CustomPasswordField(
                hintText: 'Password',
                controller: passwordTextController,
                validator: (value) {
                  if (value == null || value.isEmpty && value.length < 7) {
                    return 'Please enter a password';
                  }
                  if (value.length < 7) {
                    return 'Must be more than 7 charater';
                  }
                  return null;
                },
              ),
              const Gap(16),
              RoundedOutlinedButton(
                text: 'LOG IN',
                textColor: AppColors.mainWhite,
                color: AppColors.mainBlack,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    return Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
