import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/model/product_model_db.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';

class CustomProductCheckout extends StatelessWidget {
  const CustomProductCheckout({super.key, required this.cart});
  final CartModelDb cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          width: 93.52.w,
          height: 94.50.h,
          decoration: ShapeDecoration(
            color: AppColors.containerColorBack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: cart.image,
            width: 89.13.w,
            height: 84.16.h,
            fit: BoxFit.fill,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 196.48.w,
                  child: Text(
                    cart.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                ),
                // SizedBox(height: 4.h,),
                Text(
                  '\$${cart.price}',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColorThree,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.43.h,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
            SizedBox(
              width: 225.w,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () =>context.read<CartCubit>().decreaseQuantity(cart.id),
                    child: Container(
                      width: 28.r,
                      height: 28.r,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.r),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.w, color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: AppColors.textColorSecond,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.5.w,
                  ),
                  Text(
                    '${cart.quantity}',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFF303336),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 7.5.w,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartCubit>().increaseQuantity(cart.id);

                    },
                    child: Container(
                      width: 28.r,
                      height: 28.r,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2.r),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.w, color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartCubit>().addAndRemoveCart(cart);
                    },
                    child: Container(
                      width: 28.r,
                      height: 28.r,
                      padding: EdgeInsets.all(3.r),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: AppColors.containerColorBack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: AppColors.sliderColor,
                        size: 20.r,
                      ),
                    ),
                  ),
                 const Spacer(),
                  Text(
                    'x${cart.quantity}',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.43.h,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
