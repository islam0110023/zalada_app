import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class CustomListTileCheckout extends StatelessWidget {
  const CustomListTileCheckout({super.key, required this.title, required this.trailing});
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ListTile(
      contentPadding: EdgeInsets.zero,
      minTileHeight: double.minPositive,
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.textColorSecond,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 1.43.h,
        ),
      ),
      trailing: Text(
        '\$ ${trailing}',
        textAlign: TextAlign.right,
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.textColorBlack,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 1.43.h,
        ),
      ),
    ));
  }
}
