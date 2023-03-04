import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/controllers/home_page_controller.dart';

import '../controllers/user_profile_controller.dart';
import '../utils/global_variables.dart';
import '../widgets/custom_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: GestureDetector(
            //tap the image to go to the user profile page
            onTap: () => Get.to(() => const UserProfileScreen()),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/user_image.png'),
            ),
          ),
        ),
        title: const CustomText(
            text: 'Ronvest',
            size: 24,
            color: fieldTextColor,
            weight: FontWeight.bold),
        elevation: 0.h,
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () => Get.to(() => const HomePageScreen()),
            child: const CustomText(
                text: 'Join video',
                size: 16,
                color: primaryColor,
                weight: FontWeight.bold)),
      ),
    );
  }
}
