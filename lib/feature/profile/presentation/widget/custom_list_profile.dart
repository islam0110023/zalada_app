import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class CustomListProfile extends StatelessWidget {
  const CustomListProfile({super.key, required this.name, required this.onTap, required this.icon, this.widget});
  final String name;
  final VoidCallback onTap;
  final IconData icon;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 44.r,
          height: 44.r,
          decoration: ShapeDecoration(
            color: AppColors.containerColorBack,
            shape: OvalBorder(),
          ),
          child: Icon(icon,color: AppColors.obscureColor,),
        ),
        title: Text(
          name,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            height: 1.50.h,
          ),
        ),
        trailing:widget==null? Icon(Icons.arrow_forward_ios_outlined,color: AppColors.obscureColor,):widget,
      ),
    );
  }
}
