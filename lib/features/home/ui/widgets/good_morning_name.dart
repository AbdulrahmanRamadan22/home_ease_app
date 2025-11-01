import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/translations/locale_keys.g.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';
 
RichText goodMorningName() {
  // var fullName= CacheHelper.getData(key: 'fullName');

  return RichText(
    text: TextSpan(
        text: LocaleKeys.GoodMorning.tr(),
        // 'Good Morning '.tr(),
        style: TextStyles.font14Black400,
        children: [
          TextSpan(
            // text: fullName,

            text: LocaleKeys.Abdelrahman.tr(),

            //  'Abdelrahman'.tr(),
            style: TextStyles.font14yallow500,
          )
        ]),
  );
}
