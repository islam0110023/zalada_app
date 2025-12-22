import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/feature/onBoarding/model/onboarding_model.dart';

class ListData {
  ListData._();
  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
        image: 'assets/images/onboarding1.svg',
        title: "Find the item you've \nbeen looking for",
        subTitle:
            "Here you'll see rich varieties of goods,\ncarefully classified for seamless browsing\nexperience",
        progress: .5),
    OnboardingModel(
        image: 'assets/images/onboarding2.svg',
        title: 'Get those shopping\nbags filled',
        subTitle:
            "Add any item you want to your cart or save\nit on your wishlist, so you don't miss it in\nyour future purchase.",
        progress: .75),
    OnboardingModel(
        image: 'assets/images/onboarding3.svg',
        title: 'Fast & Secure\npayment',
        subTitle:
            'There are many payment options available\nto speed up and simplify your payment\nprocess.',
        progress: 1)
  ];
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 140.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: SizedBox(
              width: 60.r,
              height: 60.r,
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? const Center(
                      child: CupertinoActivityIndicator(
                      color: Colors.black,
                    ))
                  : const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xffEF8262)),
                    ),
            ),
          ),
        );
      },
    );
  }
}
