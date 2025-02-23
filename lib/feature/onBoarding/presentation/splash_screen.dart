import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/feature/home/presentation/home_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 6),
      () {
        if (CacheHelper.getData(key: "token") != null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomePage.id,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            OnboardingPage.id,
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/images/logo_icon.svg"),
            SizedBox(
              height: 34.h,
            ),
            SvgPicture.asset("assets/images/logo_text.svg")
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 5.seconds)
          .scale(begin: Offset(.1, .1), end: Offset(1, 1), duration: 5.seconds)
          .shake(hz: 4, duration: 2.seconds)
          .slide(begin: Offset(-3, 0), end: Offset(0, 0), duration: 2.seconds)
          .then()
          .slide(begin: Offset(1, 0), end: Offset(0, 0), duration: 700.ms)
          .then()
          .moveY(begin: -200, end: 0, duration: 1.seconds),
    );
  }
}
