import 'package:flutter/material.dart'; 
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:home_service_app/core/theming/text_styles%20.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Address'.tr(),
          style: TextStyles.font18Black700,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 500.h,
          ),
        ],
      ),
    );
  }
}
