import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../shared_widgets/buttons/rounded_oulined_button.dart';
import '../../../shared_widgets/custom_text_field.dart';

class CreateNickNamePage extends StatefulWidget {
  const CreateNickNamePage({
    super.key,
    this.prevPage,
  });

  final Function()? prevPage;

  @override
  State<CreateNickNamePage> createState() => _CreateNickNamePageState();
}

class _CreateNickNamePageState extends State<CreateNickNamePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nickNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Register', style: AppTextStyles.pageNameText),
              const Gap(32),
              CustomTextField(
                hintText: 'jane_muckway',
                controller: nickNameController,
                prefixText: '@',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Come up with a nickname';
                  }
                  return null;
                },
              ),
              const Gap(16),
              Row(
                children: [
                  Expanded(
                    child: RoundedOutlinedButton(
                      text: 'Back',
                      textColor: AppColors.mainWhite,
                      color: AppColors.mainBlack,
                      onTap: () {
                        widget.prevPage?.call();
                      },
                    ),
                  ),
                  const Gap(16),
                  Expanded(
                    child: RoundedOutlinedButton(
                      text: 'NEXT',
                      textColor: AppColors.mainWhite,
                      color: AppColors.hoverCursorText,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
