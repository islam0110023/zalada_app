import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.name, required this.onPressed});
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.containerColorOnboarding,
      minWidth: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 24.r,vertical: 16.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Text(
        name,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.primaryColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          height: 1.50.h,
        ),
      ),
    );
  }
}
