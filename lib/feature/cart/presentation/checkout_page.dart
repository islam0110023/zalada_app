import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  static const id="CheckoutPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Order',
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

    ).animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
