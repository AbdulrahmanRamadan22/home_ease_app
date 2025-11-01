import 'package:flutter/material.dart';
import '../../../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart'; 


class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.termsAndConditions.tr(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemBuilder: (context, index) {
              return Text(
                " .. هذا النص يمكن استبدالة بنص مماثل هذا النص يمكن استبدالة بنص مماثل هذا النص يمكن استبدالة بنص مماثل ",
                style: TextStyles.font16Black700,
              );
            },
            itemCount: 10),
      ),
    );
  }
}
