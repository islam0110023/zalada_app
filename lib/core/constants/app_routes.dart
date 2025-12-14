import 'package:go_router/go_router.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/auth/presentation/otp_page.dart';
import 'package:zalada_app/feature/auth/presentation/register_page.dart';
import 'package:zalada_app/feature/cart/presentation/checkout_page.dart';
import 'package:zalada_app/feature/cart/presentation/new_address.dart';
import 'package:zalada_app/feature/cart/presentation/payment_check.dart';
import 'package:zalada_app/feature/cart/presentation/select_address_page.dart';
import 'package:zalada_app/feature/home/presentation/home_page.dart';
import 'package:zalada_app/feature/home/presentation/notification_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/onboarding_page.dart';
import 'package:zalada_app/feature/onBoarding/presentation/splash_screen.dart';
import 'package:zalada_app/feature/product_details/presentation/product_details.dart';
import 'package:zalada_app/feature/profile/presentation/add_new_payment.dart';
import 'package:zalada_app/feature/profile/presentation/edit_profile.dart';
import 'package:zalada_app/feature/profile/presentation/payment_method_page.dart';
import 'package:zalada_app/feature/profile/presentation/privacy_policy.dart';
import 'package:zalada_app/feature/search/presentation/search_product_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String home = '/home';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String productDetails = '/product-details';
  static const String editProfile = '/edit-profile';
  static const String paymentMethod = '/payment-method';
  static const String addPayment = '/add-payment';
  static const String privacyPolicy = '/privacy-policy';
  static const String checkout = '/checkout';
  static const String selectAddress = '/select-address';
  static const String newAddress = '/new-address';
  static const String paymentCheck = '/payment-check';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: onboarding,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) => OtpPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => SearchProductPage(),
      ),
      GoRoute(
        path: notifications,
        builder: (context, state) => NotificationPage(),
      ),
      GoRoute(
        path: productDetails,
        builder: (context, state) => ProductDetails(),
      ),
      GoRoute(
        path: editProfile,
        builder: (context, state) => EditProfile(),
      ),
      GoRoute(
        path: paymentMethod,
        builder: (context, state) => PaymentMethodPage(),
      ),
      GoRoute(
        path: addPayment,
        builder: (context, state) => AddNewPayment(),
      ),
      GoRoute(
        path: privacyPolicy,
        builder: (context, state) => PrivacyPolicy(),
      ),
      GoRoute(
        path: checkout,
        builder: (context, state) => CheckoutPage(),
      ),
      GoRoute(
        path: selectAddress,
        builder: (context, state) => SelectAddressPage(),
      ),
      GoRoute(
        path: newAddress,
        builder: (context, state) => NewAddress(),
      ),
      GoRoute(
        path: paymentCheck,
        builder: (context, state) => PaymentCheck(),
      ),
    ],
  );
}
