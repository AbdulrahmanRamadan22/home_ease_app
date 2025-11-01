import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart'; 
import 'package:home_service_app/core/routing/routes.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:home_service_app/core/theming/text_styles%20.dart';
import 'package:home_service_app/core/helpers/navigation_extensions.dart';
// ignore_for_file: depend_on_referenced_packages


class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account ? ',
              style: TextStyles.font16Black400,
            ),
            TextSpan(
              text: ' Register',
              style: TextStyles.font16Black700,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.registerScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
