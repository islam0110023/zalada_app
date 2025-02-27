import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class NoCarts extends StatelessWidget {
  const NoCarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 44.h,),
        SvgPicture.asset("assets/images/cart_image.svg",width: 201.r,height: 201.r,),
        SizedBox(height: 24.h,),
        Text(
          'Your cart is an empty!',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            height: 1.40.h,
          ),
        ),
        SizedBox(height: 12.h,),
        SizedBox(
          width: 265.w,
          child: Text(
            "Looks like you haven't added anything to your cart yet",
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColorSecond,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43.h,
            ),
          ),
        )

      ],
    );
  }
}
