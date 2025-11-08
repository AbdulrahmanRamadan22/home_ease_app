import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:home_service_app/features/home/ui/home_screen.dart';
import '../../features/address/ui/add_address_screen.dart';
import '../../features/contact_us/ui/contact_us_screen.dart';
import '../../features/hourlycleaning/ui/widget/container_step_2.dart';
import 'package:home_service_app/features/home_layout/logic/cubit.dart';
import 'package:home_service_app/features/profile/ui/profile_screen.dart';
import 'package:home_service_app/features/company/ui/company_screen.dart';
import 'package:home_service_app/features/payment/ui/payment_screen.dart';
import 'package:home_service_app/features/auth/login/ui/login_screen.dart';
import 'package:home_service_app/features/mywallet/ui/my_wallet_screen.dart';
import 'package:home_service_app/features/SplashScreen/ui/splash_screen.dart';
import 'package:home_service_app/features/categorie/ui/categories_scraan.dart';
import 'package:home_service_app/features/profile/ui/edit_profile_screen.dart';
import 'package:home_service_app/features/auth/register/ui/register_screen.dart';
import 'package:home_service_app/features/home_layout/ui/home_layout_scraan.dart';
import 'package:home_service_app/features/add_address/ui/add_address_screen.dart';
import 'package:home_service_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:home_service_app/features/notification/ui/notification_screen.dart';
import 'package:home_service_app/features/dashbord/ui/screens/dash_bord_screen.dart';
import 'package:home_service_app/features/resetpassword/ui/reset_password_screen.dart';
import 'package:home_service_app/features/select_address/ui/select_address_screen.dart';
import 'package:home_service_app/features/hourlycleaning/ui/hourly_cleaning_screen.dart';
import 'package:home_service_app/features/select_language/ui/select_language_screen.dart';
import 'package:home_service_app/features/auth/forgetpassword/ui/forget_password_screen.dart';
// ignore_for_file: depend_on_referenced_packages

// import 'package:home_ease/core/di/dependency_injection.dart';

class AppRouter {
  AppRouter();

  Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: non_constant_identifier_names

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      // case Routes.contactUsScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ContactUS(),
      //   );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case Routes.selectLanguageScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectLanguageScreen(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        );

      case Routes.notificationScreen:
        return MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        );

      case Routes.paymentScreenScreen:
        return MaterialPageRoute(
          builder: (context) => const PaymentScreen(),
        );

      case Routes.selectAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectAddress(),
        );

      case Routes.addAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddAddressScreen(),
        );

      case Routes.hourlyCleanScreen:
        return MaterialPageRoute(
          builder: (context) => const HourlyCleaningScreen(),
        );

      case Routes.companyscreen:
        return MaterialPageRoute(
          builder: (context) => const CompanyScreen(),
        );

      case Routes.mywalletscreen:
        return MaterialPageRoute(
          builder: (context) => const MyWalletScreen(),
        );

      case Routes.dashbordscreen:
        return MaterialPageRoute(
          builder: (context) => const DashBordScreen(),
        );

      // case Routes.addcategoriesdashbordscreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const AddCategores(),
      //   );

      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
        );

      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );

      case Routes.contactUsScreen:
        return MaterialPageRoute(
          builder: (context) => const ContactUS(),
        );

           case Routes.addAddressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddAddressScreen(),
        );


        

      // case Routes.editProfileScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const EditProfileScreen(),
      //   );

      case Routes.categoriesScreen:
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );

      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      // case Routes.adminCategoriesScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const AdminCategoriesScreen(),
      //   );

      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeLayoutCubit(),
            child: const HomeLayoutScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
