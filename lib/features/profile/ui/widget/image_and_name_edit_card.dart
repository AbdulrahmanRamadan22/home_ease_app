import 'package:flutter/material.dart'; 
import 'package:easy_localization/easy_localization.dart';
import 'package:home_service_app/core/routing/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';
import 'package:home_service_app/core/widgets/custom_button.dart'; 
import 'package:home_service_app/core/helpers/navigation_extensions.dart';
// ignore: must_be_immutable
class ProfileEditCard extends StatelessWidget {
  const ProfileEditCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Edit Profile'.tr(),
          style: TextStyles.font16Black700,
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomButton(
          width: 120.w,
          height: 55.h,
          radius: 60.r,
          onPressed: () {
            context.pushNamed(Routes.editProfileScreen);
          },
          text: 'Edit'.tr(),
          style: TextStyles.font14Black700,
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}

// Stack imageProfile() {
//   return const Stack(children: [
//     CircleAvatar(
//       radius: 72.0,
//       backgroundColor: Color.fromARGB(255, 89, 251, 103),
//       child: CircleAvatar(
//           radius: 70.0,
//           backgroundImage: NetworkImage(
//               "https://media.istockphoto.com/id/587805156/vector/profile-picture-vector-illustration.jpg?s=612x612&w=0&k=20&c=gkvLDCgsHH-8HeQe7JsjhlOY6vRBJk_sKW9lyaLgmLo=")),
//     ),
//   ]);
// }
