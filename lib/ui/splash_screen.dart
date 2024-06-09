import 'package:flutter/material.dart';
import 'package:furry_care/core/constants/colors.dart';
import 'package:furry_care/core/constants/strings.dart';
import 'package:furry_care/core/constants/svg_assets.dart';
import 'package:furry_care/ui/screens/onboarding/onbaording_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const OnboardingScreen());
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "$staticAsset/splash.png",
                scale: 2,
              ),
            )
          ]),
    );
  }
}
