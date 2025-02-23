import 'package:zalada_app/feature/onBoarding/model/onboarding_model.dart';

class ListData {
  ListData._();
  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
        image: "assets/images/onboarding1.svg",
        title: "Find the item you've \nbeen looking for",
        subTitle:
            "Here you'll see rich varieties of goods,\ncarefully classified for seamless browsing\nexperience",
        progress: .5),
    OnboardingModel(
        image: "assets/images/onboarding2.svg",
        title: "Get those shopping\nbags filled",
        subTitle:
            "Add any item you want to your cart or save\nit on your wishlist, so you don't miss it in\nyour future purchase.",
        progress: .75),
    OnboardingModel(
        image: "assets/images/onboarding3.svg",
        title: "Fast & Secure\npayment",
        subTitle:
            "There are many payment options available\nto speed up and simplify your payment\nprocess.",
        progress: 1)
  ];
}
