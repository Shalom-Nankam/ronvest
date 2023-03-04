import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:ronvest_app/controllers/home_page_controller.dart';
import 'package:ronvest_app/views/stateless_view.dart';

class HomeView extends StatelessView<HomePageScreen, HomePageController> {
  const HomeView(HomePageController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
