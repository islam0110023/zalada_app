import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/model/product_model_db.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';
import 'package:zalada_app/feature/cart/presentation/widget/custom_bottom_checkout.dart';
import 'package:zalada_app/feature/cart/presentation/widget/custom_list_tile_checkout.dart';
import 'package:zalada_app/feature/cart/presentation/widget/custom_product_checkout.dart';

import '../../../core/constants/app_colors.dart';
import '../../profile/presentation/widget/custom_list_tile_payment.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  static const id = "CheckoutPage";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          extendBody: true,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            leadingWidth: 90,
            toolbarHeight: 70,
            centerTitle: true,
            title: Text(
              'Order',
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
                      side:
                          BorderSide(width: 1.r, color: AppColors.borderColor),
                      borderRadius: BorderRadius.circular(34.r),
                    ),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.obscureColor,
                  )),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 8.h,
                )),
                SliverToBoxAdapter(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Address',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.44.h,
                      ),
                    ),
                    trailing: Text(
                      'Edit',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorThree,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 12.h,
                )),
                SliverToBoxAdapter(
                  child: Text(
                    '🏠  Home',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 8.h,
                )),
                SliverToBoxAdapter(
                  child: Text(
                    '10th of ramadan City',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorSecond,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.67.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 19.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Items',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4.h,
                      margin: EdgeInsets.only(bottom: 12.r),
                      decoration:
                          BoxDecoration(color: AppColors.containerColorThree),
                    ),
                  ),
                ),
                SliverList.separated(
                  itemCount: cubit.carts.length,
                  itemBuilder: (context, index) {
                    return CustomProductCheckout(
                        cart: cubit.carts[index] as CartModelDb);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4.h,
                      margin: EdgeInsets.symmetric(vertical: 16.r),
                      decoration:
                          BoxDecoration(color: AppColors.containerColorThree),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Payment Summary',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 0.h,
                  ),
                ),
                CustomListTileCheckout(
                    title: "Price",
                    trailing: "${cubit.getTotalPrice().toStringAsFixed(2)}"),
                CustomListTileCheckout(title: "Delivery Fee", trailing: " 20"),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    height: 1.h,
                    margin: EdgeInsets.symmetric(vertical: 16.r),
                    decoration:
                        BoxDecoration(color: AppColors.containerColorThree),
                  ),
                ),
                CustomListTileCheckout(
                    title: "Total Payment",
                    trailing:
                        " ${cubit.getTotalPrice() == 0 ? 0 : (cubit.getTotalPrice() + 20).toStringAsFixed(2)}"),
                SliverToBoxAdapter(
                  child: FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4.h,
                      margin: EdgeInsets.symmetric(vertical: 16.r),
                      decoration:
                          BoxDecoration(color: AppColors.containerColorThree),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    'Payment Method',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.44.h,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 16.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomListTilePayment(
                      image: "assets/images/image 22.png",
                      title: "MasterCard",
                      subTitle: "**** **** 0783 7873"),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 100.h,
                ))
              ],
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: CustomButton(
              name:
                  "Pay   \$${cubit.getTotalPrice() == 0 ? 0 : (cubit.getTotalPrice() + 20).toStringAsFixed(2)}",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  transitionAnimationController: AnimationController(
                    vsync: Navigator.of(context),
                    duration: Duration(milliseconds: 999),
                    reverseDuration: Duration(milliseconds: 999),
                  ),
                  builder: (context) {
                    return CustomBottomCheckout();
                  },
                );
              },
            ),
          ),
        );
      },
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
