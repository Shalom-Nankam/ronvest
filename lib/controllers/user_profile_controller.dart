import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ronvest_app/views/user_profile_view.dart';

import '../state_management/auth_manager.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => UserProfileController();
}

class UserProfileController extends State<UserProfileScreen> {
  final AuthManager authManager = Get.find();

  late Future<void> getProfile;

  @override
  void initState() {
    getProfile = authManager.getProfile();
    super.initState();
  }

//make api call to get the user profile
  // Fuvoid getProfile() async {
  //   await authManager.getProfile();
  // }

  @override
  Widget build(BuildContext context) {
    return UserProfileView(this);
  }
}
