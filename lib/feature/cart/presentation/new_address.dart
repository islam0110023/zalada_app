import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/core/widget/custom_text_input.dart';

class NewAddress extends StatelessWidget {
  const NewAddress({super.key});
  static const id = 'NewAddress';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'New Address',
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
        actions: [
          Container(
              alignment: Alignment.center,
              width: 44.r,
              height: 44.r,
              margin: EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
              padding: EdgeInsets.all(10.r),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(34.r),
                ),
              ),
              child: Icon(
                Icons.search,
                color: AppColors.obscureColor,
              ))
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            Image.asset('assets/images/Map1.png'),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Select your location from the map',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColorBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.44.h,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Move the pin on the map to find your location and select the delivery address',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColorSecond,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.43.h,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              label: 'Address Detail',
              hint: 'address',
              initialValue: 'Jl. Seturan indah No.9, Kledokan',
              onTap: () {},
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
        child: CustomButton(
          name: 'Confirm Address',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
