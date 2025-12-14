import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:zalada_app/core/constants/app_routes.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const id = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      5500.ms,
      () {
        if (CacheHelper.getData(key: 'token') != null) {
          context.go(AppRoutes.home);
        } else {
          context.go(AppRoutes.onboarding);
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
            SvgPicture.asset('assets/images/logo_icon.svg'),
            SizedBox(
              height: 34.h,
            ),
            SvgPicture.asset('assets/images/logo_text.svg')
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 5.seconds)
          .scale(
              begin: const Offset(.1, .1),
              end: const Offset(1, 1),
              duration: 5.seconds)
          .shake(hz: 4, duration: 2.seconds)
          .slide(
              begin: const Offset(-3, 0),
              end: const Offset(0, 0),
              duration: 2.seconds)
          .then()
          .slide(
              begin: const Offset(1, 0),
              end: const Offset(0, 0),
              duration: 700.ms)
          .then()
          .moveY(begin: -200, end: 0, duration: 1.seconds),
    );
  }
}
