import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronvest_app/utils/global_variables.dart';

import 'custom_text.dart';

//the bottom half of the user profile page
class UserProfileBottomContainer extends StatelessWidget {
  const UserProfileBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40.w, top: 10.h, right: 10.w),
          child: const CustomText(
              text: "Public Challenges",
              size: 16,
              color: Color(0xff909090),
              style: FontStyle.normal,
              weight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.all(13).r,
          child: Container(
            padding: EdgeInsets.fromLTRB(10.w, 7.h, 0.w, 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6).r,
              border: Border.all(color: const Color(0xff7fccef), width: 0.4),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 88.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(6).r,
                              bottomLeft: const Radius.circular(6).r)),
                      child: Image.asset('assets/images/vacation.png'),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            text: "Vacation Savings",
                            size: 17,
                            color: Color(0xff253e4a),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                        SizedBox(
                          height: 7.h,
                        ),
                        SizedBox(
                          height: 34.h,
                          width: 247.h,
                          child: const CustomText(
                              text:
                                  "Let’s save for a December vacation in Dubai.",
                              size: 14,
                              color: Color(0xff253e4a),
                              style: FontStyle.normal,
                              align: TextAlign.left,
                              weight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const CustomText(
                            text: "Started by James A., 3 days ago.",
                            size: 14,
                            color: primaryColor,
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 296.w,
                  child: Divider(
                    height: 15.h,
                    color: const Color(0xff707070),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(
                            text: "Target Amount",
                            size: 14,
                            color: Color(0xffc3c3c3),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                        CustomText(
                            text: "N 10,000,000.00",
                            size: 15,
                            color: Color(0xff253e4a),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                      ],
                    ),
                    SizedBox(
                      width: 35.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(
                            text: "Target date",
                            size: 14,
                            color: Color(0xffc3c3c3),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                        CustomText(
                            text: "21st December, 2022.",
                            size: 15,
                            color: Color(0xff253e4a),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.w,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                            text: "Completed",
                            size: 14,
                            color: Color(0xff9d9d9d),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                        Row(
                          children: [
                            Container(
                              height: 14.h,
                              width: 157.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50).r),
                              child: const LinearProgressIndicator(
                                value: 0.56,
                                backgroundColor: Color(0xffd8e9f1),
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            const CustomText(
                                text: "56%",
                                size: 14,
                                color: primaryColor,
                                style: FontStyle.normal,
                                weight: FontWeight.w400),
                            SizedBox(
                              width: 19.w,
                            ),
                            Container(
                              height: 29.h,
                              width: 109.w,
                              decoration: BoxDecoration(
                                color: const Color(0xffe5e5e5),
                                borderRadius: BorderRadius.circular(10).r,
                              ),
                              child: const Center(
                                child: CustomText(
                                    text: "33 people joined",
                                    size: 12,
                                    color: Color(0xff585858),
                                    style: FontStyle.normal,
                                    weight: FontWeight.w400),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 38.h,
                      width: 173.w,
                      child: OutlinedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xff253e4a))),
                        onPressed: () {},
                        child: const CustomText(
                            text: "+Join this challenge",
                            size: 15,
                            color: Color(0xffffffff),
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      height: 38.h,
                      width: 140.w,
                      child: OutlinedButton(
                        style: const ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(primaryColor),
                        ),
                        onPressed: () {},
                        child: const CustomText(
                            text: "Leadership",
                            size: 15,
                            color: primaryColor,
                            style: FontStyle.normal,
                            weight: FontWeight.w400),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
