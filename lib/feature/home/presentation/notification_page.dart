import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static const id = "NotificationPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leadingWidth: 60,
              toolbarHeight: 70,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 44.r,
                    height: 44.r,
                    margin: EdgeInsets.symmetric(horizontal: 0.r, vertical: 6.r),
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Your Notification',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.25.h,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Today',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorSecond,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverList.separated(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF3F6FB),
                      shape: OvalBorder(),
                    ),
                    child: Icon(
                      Icons.discount,
                      color: AppColors.sliderColor,
                    ),
                  ),
                  title: Text(
                    '30% Special Discount!',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.50.h,
                    ),
                  ),
                  subtitle: Text(
                    'Special promotion only valid today',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorSecond,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                  ),
                ).animate().slideX(duration: 1000.ms);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 16.h,
                );
              },
            )
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
