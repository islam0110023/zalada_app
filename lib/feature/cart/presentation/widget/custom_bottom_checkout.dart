import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';
import 'package:zalada_app/feature/home/presentation/home_page.dart';

class CustomBottomCheckout extends StatelessWidget {
  const CustomBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      width: double.infinity,
      height: 517.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
      child: Column(
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
            height: 24.h,
            width: double.infinity,
          ),
          SvgPicture.asset("assets/images/cong_image.svg"),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Order Successful!",
            style: GoogleFonts.plusJakartaSans(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                height: 1.3.h,
                color: AppColors.textColorBlack),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "You have successfully made order",
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 14.sp,
                color: AppColors.textColorSecond,
                fontWeight: FontWeight.w400,
                height: 1.20.h),
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomButton(
            name: "Back to Home",
            onPressed: () {
              context.read<CartCubit>().clearAllCart();

              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.id,
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
