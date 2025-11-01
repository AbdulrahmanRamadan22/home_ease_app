import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:home_service_app/home_ease__app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/helpers/constants.dart'; 
import 'package:home_service_app/core/helpers/my_bloc_observer.dart';
import 'package:home_service_app/core/networking/local/cache_helper.dart';

// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages

// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: const FirebaseOptions(
      apiKey: "AIzaSyBbkJ9vmbaQHDFBdXUJdCrnS8qIm3yxSt0",
      appId: "1:962821068285:android:6b9c368869bc6cb2503594",
      messagingSenderId: "962821068285",
      projectId: "home-ease-distribute",
      storageBucket: "home-ease-distribute.appspot.com",
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,

    statusBarIconBrightness:
        Brightness.dark, //<-- For Android SEE HERE (dark icons)
  ));

  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  var onBoarding = CacheHelper.getData(key: 'onBoarding');

// <<<<<<< HEAD
  //uId = CacheHelper.getData(key: 'uId');

  uId != null ? uId = CacheHelper.getData(key: 'uId') : uId = null;

  // log(uId!);
  log(uId.toString());

  // var selectLanguageScreen = CacheHelper.getData(key: 'selectLanguageScreen');

  // String initialRoute;

  // if (selectLanguageScreen != null) {
  //   if (onBoarding != null) {
  //     if (uId != null) {
  //       email = CacheHelper.getData(key: 'email');
  //       if (email == "admin@gmail.com") {
  //         initialRoute = Routes.dashbordscreen;
  //       } else {
  //         initialRoute = Routes.homeLayout;
  //       }
  //     } else {
  //       initialRoute = Routes.loginScreen;
  //     }
  //   } else {
  //     initialRoute = Routes.onBoardingScreen;
  //   }
  // } else {
  //   initialRoute = Routes.selectLanguageScreen;
  // }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar', 'EG'),
      // assetLoader: const CodegenLoader(),
      // saveLocale: true,
      child: const HomeEase(
        initialRoute: Routes.splashScreen,
      ),
    ),
  );
}
