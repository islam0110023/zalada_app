import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/feature/cart/presentation/new_address.dart';
import 'package:zalada_app/feature/cart/presentation/payment_check.dart';

import '../../../core/widget/custom_button.dart';

class SelectAddressPage extends StatelessWidget {
  const SelectAddressPage({super.key});
  static const id = "SelectAddressPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Select Address',
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
          GestureDetector(
            onTap: () {
               Navigator.pushNamed(context, NewAddress.id);
            },
            child: Container(
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
                  Icons.add,
                  color: AppColors.obscureColor,
                )),
          )
        ],
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              height: 144.h,
              padding: EdgeInsets.all(16.r),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Stack(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: double.minPositive,
                    leading: Container(
                      width: 32.r,
                      height: 32.r,
                      padding:  EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.containerColorBack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Text(
                        '🏡',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.71,
                        ),
                      ),
                    ),
                    title: Text(
                      'Home',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.29.h,
                      ),
                    ),
                    trailing: Container(
                      height: 21.h,
                      padding:  EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
                      decoration: ShapeDecoration(
                        color: Color(0xFF20AD20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        'Default',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.primaryColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          color:AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      ),
                      subtitle: Text(
                        '+62812 788 61 1672',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        ),
                      ),
                      trailing: Image.asset("assets/images/Map.png"),
                    ),
                  )

                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              height: 144.h,
              padding: EdgeInsets.all(16.r),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Stack(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: double.minPositive,
                    leading: Container(
                      width: 32.r,
                      height: 32.r,
                      padding:  EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.containerColorBack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Text(
                        '🏢',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.71,
                        ),
                      ),
                    ),
                    title: Text(
                      'Office',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.29.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          color:AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      ),
                      subtitle: Text(
                        '+62812 788 61 1672',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        ),
                      ),
                      trailing: Image.asset("assets/images/Map.png"),
                    ),
                  )

                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: double.infinity,
              height: 144.h,
              padding: EdgeInsets.all(16.r),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Stack(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minTileHeight: double.minPositive,
                    leading: Container(
                      width: 32.r,
                      height: 32.r,
                      padding:  EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.containerColorBack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Text(
                        '🏘️',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.71,
                        ),
                      ),
                    ),
                    title: Text(
                      'Apartment',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.29.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Jl. Pangkur, Ngaglik, Sleman, Yogyakarta',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.plusJakartaSans(
                          color:AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.43.h,
                        ),
                      ),
                      subtitle: Text(
                        '+62812 788 61 1672',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        ),
                      ),
                      trailing: Image.asset("assets/images/Map.png"),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        child: CustomButton(
          name:"Select Address",
          onPressed: () {
            Navigator.pushNamed(context, PaymentCheck.id);
          },
        ),
      ),

    )   .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
