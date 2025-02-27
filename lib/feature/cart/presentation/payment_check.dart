import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/cart/presentation/checkout_page.dart';
import 'package:zalada_app/feature/profile/presentation/widget/custom_list_tile_payment.dart';
import 'package:zalada_app/feature/profile/presentation/widget/custom_payment_bottom.dart';

class PaymentCheck extends StatelessWidget {
  const PaymentCheck({super.key});
  static const id = "PaymentCheck";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Payment Method',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(34.r),
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 44.r,
              height: 44.r,
              margin: EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
              padding: EdgeInsets.all(12.r),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(34.r),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.obscureColor,
              )),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            CustomListTilePayment(
                image: "assets/images/image 22.png",
                title: "MasterCard",
                subTitle: "**** **** 0783 7873"),
            SizedBox(
              height: 16.h,
            ),
            CustomListTilePayment(
                image: "assets/images/image 20.png",
                title: "Paypal",
                subTitle: "**** **** 0783 7873"),
            SizedBox(
              height: 16.h,
            ),
            CustomListTilePayment(
                image: "assets/images/image 21.png",
                title: "Apple Pay",
                subTitle: "**** **** 0783 7873")
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        child: CustomButton(
          name: "Continue",
          onPressed: () {
          Navigator.pushNamed(context, CheckoutPage.id);
          },
        ),
      ),
    ).animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
