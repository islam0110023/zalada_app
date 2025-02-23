import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/core/network/dio_helper.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/auth/presentation/register_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/onboarding_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/splash_screen.dart';

import 'feature/auth/presentation/otp_page.dart';
import 'feature/home/presentation/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      ensureScreenSize: true,
      splitScreenMode: true,

      child: MaterialApp(
        builder: (context, child) {
          return Container(
            color: Colors.white,
            child: child,
          );
        },
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.id:(context)=>SplashScreen(),
          OnboardingPage.id:(context)=>OnboardingPage(),
          LoginPage.id:(context)=>LoginPage(),
          RegisterPage.id:(context)=>RegisterPage(),
          OtpPage.id:(context)=>OtpPage(),
          HomePage.id:(context)=>HomePage(),

        },
        initialRoute:SplashScreen.id ,
       // home: SplashScreen(),
      ),
    );
  }
}
