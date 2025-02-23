import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/auth/presentation/otp_page.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 334.h,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 66.67.w,
              height: 4.h,
              margin: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.20000000298023224),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Forget password",
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColorBlack,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              height: 1.25.h,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "Select which contact details should we use to reset your password",
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColorSecond,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.43.h,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44.w,
                    height: 44.h,
                    padding: EdgeInsets.all(10.r),
                    decoration: ShapeDecoration(
                      color: AppColors.containerColorBack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.mail_solid,
                      color: AppColors.obscureColor,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send via Email",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorSecond,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.67.h,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "bryan.adam83@gmail.com",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 24.h,
          ),
          CustomButton(name: "Continue", onPressed: () {
            Navigator.of(context).pushNamed(OtpPage.id);
          })
        ],
      ),
    );
  }
}
