// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

SizedBox imageAndCoverProfile(
    // UserModel? userModel,
    ) {
  return SizedBox(
    height: 210.0.h,
    child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Align(alignment: AlignmentDirectional.topCenter, child: coverProfile()),
        imageProfile(),
      ],
    ),
  );
}

CircleAvatar imageProfile() {
  // var cubit = BlocProvider.of<ProfileCubit>(context);

  return CircleAvatar(
    radius: 60.0,
    backgroundColor: ColorsApp.white,
    child: CircleAvatar(
      radius: 58.0,
      backgroundImage: AssetImage(
        "assets/images/profile.png",
      ),
    ),
  );
}

Container coverProfile() {
  return Container(
    height: 150.0.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          4.0,
        ),
        topRight: Radius.circular(
          4.0,
        ),
      ),
      image: DecorationImage(
        image: AssetImage(
          "assets/images/cover2.jpg",
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
