import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/widgets/custom_button.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';
import 'package:home_service_app/core/widgets/app_text_form_field.dart';
 
 
 

class ContactUS extends StatelessWidget {
  const ContactUS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Contact Us'.tr(),
          style: TextStyles.font18Black700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We are pleased to contact you to hear your inquiries and opinions'.tr(),
                style: TextStyles.font12black500,
              ),
              const SizedBox(
                height: 29,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Name'.tr(),
                style: TextStyles.font16Black600,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextFormField(
                hintText: 'Enter your Name'.tr(),
                validator: (p0) {},
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Phone'.tr(),
                style: TextStyles.font16Black600,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextFormField(
                hintText: 'Enter your phone'.tr(),
                validator: (p0) {},
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Massage'.tr(),
                style: TextStyles.font16Black600,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextFormField(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 21),
                hintText: 'Enter Your massage'.tr(),
                validator: (p0) {},
              ),
              SizedBox(
                height: 53.h,
              ),
              CustomButton(
                text: 'Send'.tr(),
                style: TextStyles.font18Black700,
                onPressed: () {
                  //   context.pushNamed(Routes.);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
