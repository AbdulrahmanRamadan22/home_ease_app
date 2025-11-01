import 'package:flutter/material.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:home_service_app/core/theming/colors.dart';
import 'package:home_service_app/core/helpers/navigation_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.pushNamed(Routes.selectLanguageScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.mainGreen,
      body: Center(
        child: Image.asset(
          'assets/images/splash_android12_logo.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
