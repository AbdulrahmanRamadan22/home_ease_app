import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/core/theming/colors.dart';
import 'package:home_service_app/translations/locale_keys.g.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';

// ignore: depend_on_referenced_packages
 
class MyCheckboxListTile extends StatelessWidget {
 final bool isChecked;

 final void Function(bool?)? onChanged;

 
  const MyCheckboxListTile({super.key, this.isChecked=false,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          activeColor: ColorsApp.mainGreen,
          title: Text(LocaleKeys.agreeingToTheTermsAndConditions.tr(),
              style: TextStyles.font12blackOpacity700),
          value: isChecked,
          onChanged:onChanged,
        ),
      ],
    );
  }
}