import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/widgets/custom_button.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';
import 'package:home_service_app/core/helpers/navigation_extensions.dart';
import 'package:home_service_app/features/auth/login/ui/widgets/login_form.dart';
import 'package:home_service_app/features/auth/login/ui/widgets/login_card_social.dart';
import 'package:home_service_app/features/auth/login/ui/widgets/dont_have_account_text.dart';
// ignore_for_file: unnecessary_import, depend_on_referenced_packages

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Login'.tr(),
                style: TextStyles.font28Black700,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: SizedBox(
                  width: 340.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.'
                        .tr(),
                    style: TextStyles.font14Black500,
                  ),
                ),
              ),
              const LoginForm(),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.forgetPasswordScreen);
                  },
                  child: Text(
                    'Forget Password ?'.tr(),
                    style: TextStyles.font16Black600,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                text: 'Login'.tr(),
                onPressed: () {
                  context.pushNamed(
                    Routes.homeLayout,
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              const LogicCardSocial(),
              const DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
