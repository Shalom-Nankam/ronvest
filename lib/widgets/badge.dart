import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ronvest_app/widgets/custom_text.dart';

//The custom widget for membership badge
class CustomBadge extends StatelessWidget {
  const CustomBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
              color: const Color(0xffbe8039),
              borderRadius: BorderRadius.circular(50).r,
              border: Border.all(color: const Color(0xffffffff), width: 2.0)),
          child: const Center(
              child: Icon(
            Icons.star,
            size: 15,
            color: Color(0xffffffff),
          )),
        ),
        SizedBox(
          width: 5.w,
        ),
        const CustomText(
            text: 'Gold member',
            size: 9,
            color: Color(0xff969696),
            style: FontStyle.italic,
            weight: FontWeight.w400),
      ],
    );
  }
}
