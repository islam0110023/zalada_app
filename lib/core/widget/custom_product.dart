import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159.w,
      height: 220.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 159.w,
              height: 190.h,
              padding: EdgeInsets.only(
                top: 102.r,
                left: 12.r,
                right: 12.r,
                bottom: 20.r,
              ),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x11566E84),
                    blurRadius: 32.sp,
                    offset: Offset(0, 20),
                    spreadRadius: -8,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Macbook Pro 15” 2019 - Intel core i7',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                  Text(
                    '\$1240',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorThree,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.50.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 40,
            child: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.textColorBlack.withOpacity(.3),
                  spreadRadius: -5,
                  blurRadius: 35,

                )
              ]),
            ),
          ),
          Positioned(
            top: -15,
            child: Image.network(
              "https://www.asus.com/media/Odin/Websites/global/SubSeries/global_VivoBook-S_1/P_setting_xxx_0_90_end_185.png?webp",
              width: 159.w,
              height: 165,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
