import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/constants/app_routes.dart';
import 'package:zalada_app/core/widget/custom_button.dart';

class CustomBottomSheetOtp extends StatelessWidget {
  const CustomBottomSheetOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      width: double.infinity,
      // height: 600.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 66.67.w,
              height: 4.h,
              margin: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Colors.black.withAlpha(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
            width: double.infinity,
          ),
          SvgPicture.asset(
            'assets/images/cong_image.svg',
            height: 200,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Congratulations!',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                height: 1.3.h,
                color: AppColors.textColorBlack),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Your account is ready to use. You will be redirected to the Homepage in a few seconds.',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                color: AppColors.textColorSecond,
                fontWeight: FontWeight.w400,
                height: 1.20.h),
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomButton(
            name: 'Continue',
            onPressed: () {
              context.go(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
