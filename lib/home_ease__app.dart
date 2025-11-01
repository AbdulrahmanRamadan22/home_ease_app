import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:home_service_app/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/routing/app_router.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';
 
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
 


class HomeEase extends StatelessWidget {
  final String? initialRoute;

  const HomeEase({super.key, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRouter().generateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(titleTextStyle: TextStyles.font18Black700),
          useMaterial3: true,
          primarySwatch: mainGreen,
          fontFamily: 'Quicksand',
        ),
        initialRoute:  initialRoute ?? Routes.hourlyCleanScreen,
      ),
    
    );
  }
}
 
