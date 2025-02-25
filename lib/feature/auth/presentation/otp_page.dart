import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/auth/presentation/widget/custom_bottom_sheet_otp.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});
  static const id = "OtpPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OTP",
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            children: [
              SizedBox(
                height: 44.h,
                width: double.infinity,
              ),
              SvgPicture.asset("assets/images/otp_image.svg"),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Verification code",
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
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                        text:
                            "We have sent the code verification to you WhatsApp Number",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorSecond,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        ),
                      ),
                      TextSpan(
                          text: " +62812 788 6XXXX",
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textColorBlack,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.43.h,
                          ))
                    ])),
              ),
              SizedBox(
                height: 32.h,
              ),
              OtpTextField(
                autoFocus: true,
                textStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.25.h,
                ),
                numberOfFields: 4,
                showFieldAsBox: true,
                contentPadding: EdgeInsets.all(16.r),
                alignment: Alignment.center,
                filled: true,
                fillColor: AppColors.primaryColor,
                fieldWidth: 72.w,
                fieldHeight: 72.h,
                borderRadius: BorderRadius.circular(12.r),
                borderColor: AppColors.borderColor,
                borderWidth: 1.w,
                enabledBorderColor: AppColors.borderColor,
                focusedBorderColor: AppColors.borderColor,
                cursorColor: AppColors.borderColor,
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Recent code in 32s",
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.50.h,
                ),
              ),
              SizedBox(
                height: 115.h,
              ),
              CustomButton(
                name: "Continue",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    transitionAnimationController: AnimationController(
                      vsync: Navigator.of(context),
                      duration: Duration(milliseconds: 999),
                      reverseDuration: Duration(milliseconds: 999),
                    ),
                    builder: (context) {
                      return CustomBottomSheetOtp()
                          .animate()
                          .fade(duration: 999.ms)
                          .slideY(begin: 1, end: 0, duration: 800.ms);
                    },
                  );
                },
              )
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
