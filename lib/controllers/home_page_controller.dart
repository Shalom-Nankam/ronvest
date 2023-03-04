import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:ronvest_app/views/home_view.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => HomePageController();
}

class HomePageController extends State<HomePageScreen> {
  //initializing the agora client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "9be92045c0be42189c9e9ecbf6dfe3f2",
        channelName: "ronvest",
        tempToken: _token,
        uid: _uid),
  );

  @override
  void initState() {
    initAgora();
    super.initState();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(this);
  }
}

//demo token generated for tests
String _token =
    "007eJxTYGC5OKPKeFpgn+M5pWu6Ch9kPA+ZTJIIO+IVbV97Jznq21oFBsukVEsjAxPTZIOkVBMjQwvLZMtUy9TkpDSzlLRU4zSjJRzMKQ2BjAwvtH2YGRkgEMRnZyjKzytLLS5hYAAARHofZQ==";
int _uid = 0;
