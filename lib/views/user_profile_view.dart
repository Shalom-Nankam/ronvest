import 'package:flutter/material.dart';
import 'package:ronvest_app/controllers/user_profile_controller.dart';
import 'package:ronvest_app/views/stateless_view.dart';
import 'package:ronvest_app/widgets/user_profile_bottom_container.dart';

import '../widgets/user_profile_top_container.dart';

class UserProfileView
    extends StatelessView<UserProfileScreen, UserProfileController> {
  const UserProfileView(UserProfileController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                UserProfileTopContainer(
                  controller: controller,
                ),
                const UserProfileBottomContainer()
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
