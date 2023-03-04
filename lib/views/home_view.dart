import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/controllers/home_page_controller.dart';
import 'package:ronvest_app/controllers/user_profile_controller.dart';
import 'package:ronvest_app/utils/global_variables.dart';
import 'package:ronvest_app/views/stateless_view.dart';
import 'package:ronvest_app/widgets/custom_text.dart';

class HomeView extends StatelessView<HomePageScreen, HomePageController> {
  const HomeView(HomePageController state, {Key? key}) : super(state, key: key);

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
      body: SafeArea(
          child: Stack(
        //show the live video feed and controls
        children: [
          AgoraVideoViewer(
            client: controller.client,
            enableHostControls: true,
            layoutType: Layout.floating,
          ),
          AgoraVideoButtons(client: controller.client)
        ],
      )),
    );
  }
}
