import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/utils/global_variables.dart';

//Custom app bar reusable by different screens
class CustomAppbar extends StatelessWidget {
  CustomAppbar({super.key});

  final bool isIos = Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
          onPressed: () => Get.back(),
          //ios and android have different icons for a back button
          //this makes the UI look more native to a user
          icon: isIos
              ? Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                  size: 30.w,
                )
              : Icon(
                  Icons.arrow_back_outlined,
                  color: primaryColor,
                  size: 30.w,
                )),
    );
  }
}
