import 'package:home_service_app/core/theming/colors.dart';
 
  import 'package:flutter/material.dart';

Future<dynamic> showProgressIndicator(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.mainGreen,
              ),
            ),
          );
  }