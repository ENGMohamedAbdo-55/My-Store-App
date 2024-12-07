import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_store/core/common/animation/animate_do.dart';
import 'package:my_store/core/common/widgets/custom_text_field.dart';
import 'package:my_store/core/extensions/context_extensions.dart';
import 'package:my_store/core/language/lang_keys.dart';
import 'package:my_store/core/utils/app_regix.dart';

class LoginTextForm extends StatefulWidget {
  const LoginTextForm({super.key});

  @override
  State<LoginTextForm> createState() => _LoginTextFormState();
}

bool isShowPassword = true;

class _LoginTextFormState extends State<LoginTextForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          //! email TextField
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!AppRegex.isEmailValid('')) {
                  return context.translate(LangKeys.validEmail);
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.h),
          //! password TextField
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.password),
              obscureText: isShowPassword,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.length < 6 || value.isEmpty) {
                  return context.translate(LangKeys.validPasswrod);
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowPassword = !isShowPassword;
                  });
                },
                icon: isShowPassword
                    ? Icon(Icons.visibility_off, color: context.colors.textColor)
                    : Icon(Icons.visibility,
                        color: context.colors.textColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
