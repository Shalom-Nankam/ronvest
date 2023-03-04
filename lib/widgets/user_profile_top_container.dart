import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronvest_app/controllers/user_profile_controller.dart';
import 'package:ronvest_app/widgets/badge.dart';
import 'package:ronvest_app/widgets/custom_text.dart';

import '../utils/global_variables.dart';
import 'custom_appbar.dart';

//the top half of the user profile page
class UserProfileTopContainer extends StatelessWidget {
  const UserProfileTopContainer({
    super.key,
    required this.controller,
  });

  final UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff253e4a),
      padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Align(alignment: Alignment.centerLeft, child: CustomAppbar()),
          SizedBox(
            height: 19.h,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
                text: "User's profile",
                size: 20,
                color: Color(0xffffffff),
                style: FontStyle.normal,
                weight: FontWeight.w400),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 100.h,
            width: 100.h,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/user_image.png'),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(children: [
                CustomText(
                    text:
                        "${controller.authManager.userProfile["data"]["full_name"]}",
                    size: 20,
                    color: primaryColor,
                    style: FontStyle.italic,
                    weight: FontWeight.w400),
                const FractionalTranslation(
                  translation: Offset(1.4, -0.4),
                  child: CustomBadge(),
                )
              ])
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          CustomText(
              text:
                  "@${controller.authManager.userProfile["data"]["username"]}",
              size: 19,
              color: const Color(0xff909090),
              style: FontStyle.normal,
              weight: FontWeight.w400),
          SizedBox(
            height: 5.h,
          ),
          CustomText(
              text: "Member since: ${controller.authManager.userWasCreated}",
              size: 16,
              color: const Color(0xff909090),
              style: FontStyle.normal,
              weight: FontWeight.w400),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 81.h,
            padding: const EdgeInsets.all(6).r,
            width: 263.w,
            color: const Color(0xffd8e9f1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 62.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      CustomText(
                          text: "4",
                          size: 33,
                          color: Color(0xff253e4a),
                          style: FontStyle.italic,
                          weight: FontWeight.w400),
                      CustomText(
                          text: "Challenges Started",
                          size: 11,
                          color: Color(0xff676767),
                          style: FontStyle.italic,
                          align: TextAlign.center,
                          weight: FontWeight.w400),
                    ],
                  ),
                ),
                SizedBox(
                  width: 62.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      CustomText(
                          text: "1",
                          size: 33,
                          color: Color(0xff253e4a),
                          style: FontStyle.italic,
                          weight: FontWeight.w400),
                      CustomText(
                          text: "Challenges Won",
                          size: 11,
                          color: Color(0xff676767),
                          style: FontStyle.italic,
                          align: TextAlign.center,
                          weight: FontWeight.w400),
                    ],
                  ),
                ),
                SizedBox(
                  width: 62.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      CustomText(
                          text: "1",
                          size: 33,
                          color: Color(0xff253e4a),
                          style: FontStyle.italic,
                          weight: FontWeight.w400),
                      CustomText(
                          text: "Active Plans",
                          size: 11,
                          color: Color(0xff676767),
                          style: FontStyle.italic,
                          align: TextAlign.center,
                          weight: FontWeight.w400),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
