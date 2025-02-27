import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/core/db/db_helper/local_db_helper.dart';
import 'package:zalada_app/core/network/dio_helper.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/auth/presentation/register_page.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';
import 'package:zalada_app/feature/home/presentation/notification_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/onboarding_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/splash_screen.dart';
import 'package:zalada_app/feature/product_details/presentation/product_details.dart';
import 'package:zalada_app/feature/profile/presentation/add_new_payment.dart';
import 'package:zalada_app/feature/profile/presentation/edit_profile.dart';
import 'package:zalada_app/feature/profile/presentation/payment_method_page.dart';
import 'package:zalada_app/feature/profile/presentation/privacy_policy.dart';
import 'package:zalada_app/feature/search/presentation/search_product_page.dart';
import 'package:zalada_app/feature/wishlist/logic/wishlist_cubit.dart';

import 'feature/auth/presentation/otp_page.dart';
import 'feature/home/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  await SQLHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,

      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
          CartCubit()..loadedCart()
          ),
          BlocProvider(
            create: (context) => WishlistCubit()..loadFavorites(),
          ),
        ],
        child: MaterialApp(
          builder: (context, child) {
            return Container(
              color: Colors.white,
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            OnboardingPage.id: (context) => OnboardingPage(),
            LoginPage.id: (context) => LoginPage(),
            RegisterPage.id: (context) => RegisterPage(),
            OtpPage.id: (context) => OtpPage(),
            HomePage.id: (context) => HomePage(),
            SearchProductPage.id: (context) => SearchProductPage(),
            NotificationPage.id: (context) => NotificationPage(),
            ProductDetails.id: (context) => ProductDetails(),
            EditProfile.id: (context) => EditProfile(),
            PaymentMethodPage.id: (context) => PaymentMethodPage(),
            AddNewPayment.id: (context) => AddNewPayment(),
            PrivacyPolicy.id: (context) => PrivacyPolicy(),

          },
          initialRoute: SplashScreen.id,
          // home: SplashScreen(),
        ),
      ),
    );
  }
}
