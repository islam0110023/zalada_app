import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class CustomListTilePayment extends StatelessWidget {
  const CustomListTilePayment({super.key, required this.image, required this.title, required this.subTitle, this.widget});
  final String image;
  final String title;
  final String subTitle;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      //  height: 76.h,
      padding:  EdgeInsets.symmetric(vertical: 5.r),
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          image,
          width: 32.r,
          height: 32.r,
        ),
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            height: 1.43.h,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorSecond,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 1.33.h,
          ),
        ),
        trailing:widget==null? Icon(
          Icons.arrow_forward_ios_outlined,
          color: AppColors.obscureColor,
        ):widget,
      ),
    );
  }
}
