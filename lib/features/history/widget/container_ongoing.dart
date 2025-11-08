import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/colors.dart';
import 'container_detiles_ongoing.dart';

class NestedTabBarOngoing extends StatelessWidget {
  const NestedTabBarOngoing({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 39.h),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              ContainerDetilesOngoing(
                backgroundbutton: ColorsApp.mainGreen,
                companyname: 'United Group Company',
                contractname: '1 Filipino worker under contract',
                contracttext: '25ds458126fs5dha',
                date: '22/7/2022',
                image: 'assets/images/iconA.png',
                numberprice: '1500',
                pricetext: 'Price',
                ratestar: '⭐',
                namebutton: 'Accept',
              ),
              SizedBox(
                height: 31,
              ),
              ContainerDetilesOngoing(
                backgroundbutton: Colors.black12,
                companyname: 'United Group Company',
                contractname: '1 Filipino worker under contract',
                contracttext: '25ds458126fs5dha',
                date: '22/7/2022',
                image: 'assets/images/iconA.png',
                numberprice: '1500',
                pricetext: 'Price',
                ratestar: '⭐',
                namebutton: 'In Review',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
