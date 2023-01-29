import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primarycolor_light,
      body: Center(
        child: Icon(
          Icons.assistant_navigation,
          size: 70,
          color: Colors.white,
        ),
      ),
    );
  }
}
