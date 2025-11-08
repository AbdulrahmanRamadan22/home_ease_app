// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class EditImageAndCoverProfile extends StatelessWidget {
  EditImageAndCoverProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var profileImage = BlocProvider.of<ProfileCubit>(context).profileImage;
    // var coverImage = BlocProvider.of<ProfileCubit>(context).coverImage;

    return SizedBox(
      height: 210.0.h,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
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
                      image: AssetImage('assets/images/cover2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                IconButton(
                  icon: const CircleAvatar(
                    backgroundColor: ColorsApp.mainGreen,
                    radius: 20.0,
                    child: Icon(
                      Icons.add_a_photo,
                      color: ColorsApp.white,
                      // IconBroken.Indicator,
                      // IconBroken.Camera,
                      size: 16.0,
                    ),
                  ),
                  onPressed: () {
                    // BlocProvider.of<ProfileCubit>(context)
                    //     .getCoverImageGallery();
                  },
                ),
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundColor: ColorsApp.white,
                child: CircleAvatar(
                  radius: 58.0,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              IconButton(
                icon: const CircleAvatar(
                  backgroundColor: ColorsApp.mainGreen,
                  radius: 20.0,
                  child: Icon(
                    Icons.add_a_photo,
                    color: ColorsApp.white,
                    // IconBroken.Indicator,
                    // IconBroken.Camera,
                    size: 16.0,
                  ),
                ),
                onPressed: () {
                  // BlocProvider.of<ProfileCubit>(context)
                  //     .getProfileImageGallery();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
