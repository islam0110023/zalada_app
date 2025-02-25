import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/profile/presentation/add_new_payment.dart';
import 'package:zalada_app/feature/profile/presentation/widget/custom_list_tile_payment.dart';

class CustomPaymentBottom extends StatelessWidget {
  const CustomPaymentBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
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
              margin: EdgeInsets.symmetric(vertical: 10.r),
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
          ),
          CustomListTilePayment(
            image: "assets/images/image 22.png",
            title: "Credit or Debit Card",
            subTitle: "Pay with your Visa or Mastercard ",
            widget: Icon(
              Icons.check_circle_rounded,
              color: AppColors.sliderColor,
            ),
          ),
          Spacer(),
          CustomButton(
            name: "Continue",
            onPressed: () {
              Navigator.pushNamed(context, AddNewPayment.id);
            },
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
