import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/model/product_model.dart';
import 'package:zalada_app/feature/product_details/presentation/product_details.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.productModel});
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.id,arguments: productModel);
      },
      child: SizedBox(
        width: 159.w,
        height: 215.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 159.w,
                height: 200.h,
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
                      color: Color(0x35566E84),
                      blurRadius: 10.r,
                      offset: Offset(0, 10),
                      spreadRadius: -8,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productModel.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
              top: 75.h,
              left: 40.w,
              child: Container(
                width: 100.w,
                height: 60.h,
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
             // bottom: 130.h,
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
      ),
    );
  }
}
