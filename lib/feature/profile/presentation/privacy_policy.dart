import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  static const id = "PrivacyPolicy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Privacy policy',
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
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                '1. Types of Data We Collect',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
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
              Text(
                '2. Use of Your Personal Data',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                """Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\n\nThe generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.""",
               textAlign: TextAlign.start,
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
              Text(
                '3. Disclosure of Your Personal Data',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.",
                   textAlign: TextAlign.start,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorSecond,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.43.h,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
