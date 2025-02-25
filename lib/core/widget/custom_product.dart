import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/model/product_model.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159.w,
      height: 220.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 159.w,
              height: 190.h,
              padding: EdgeInsets.only(
                top: 102.r,
                left: 12.r,
                right: 12.r,
                bottom: 20.r,
              ),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x5E566E84),
                    blurRadius: 40.r,
                    offset: Offset(0, 10),
                    spreadRadius: -12,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    productModel.title!,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                  Text(
                    '\$${productModel.price}',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorThree,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.50.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 75,
            left: 40,
            child: Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.textColorBlack.withOpacity(.3),
                  spreadRadius: -5,
                  blurRadius: 35.r,
                )
              ]),
            ),
          ),
          Positioned(
              left: 18.5.w,
              child: CachedNetworkImage(
                imageUrl: productModel.image!,
                height: 130.h,
                width: 120.w,
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error,color: Colors.red,),
              ))
        ],
      ),
    );
  }
}
