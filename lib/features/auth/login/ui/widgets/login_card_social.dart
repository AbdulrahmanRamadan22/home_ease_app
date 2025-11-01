import 'package:flutter/material.dart'; 
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_service_app/core/widgets/card_contact.dart';
import 'package:home_service_app/core/theming/text_styles%20.dart';


class LogicCardSocial extends StatelessWidget {
  const LogicCardSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'OR',
          style: TextStyles.font12black500,
        ),
        CardSocial(
          text: 'Facebook',
          image: 'assets/images/facebook.png',
          onTap: () {
            
          },
        ),
        SizedBox(
          height: 14.h,
        ),
        CardSocial(
          text: 'Google',
          image: 'assets/images/Vector.png',
          onTap: () {
          },
        ),
      ],
    );
  }
}
