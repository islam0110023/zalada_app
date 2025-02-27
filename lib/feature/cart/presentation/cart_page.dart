import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';
import 'package:zalada_app/feature/cart/presentation/checkout_page.dart';
import 'package:zalada_app/feature/cart/presentation/select_address_page.dart';
import 'package:zalada_app/feature/cart/presentation/widget/no_carts.dart';

import '../../../core/widget/custom_sliver_grid.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
                height: 56.h,
              )),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: Text(
                'Your Cart Product',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.25.h,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16.h,
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              var cubit = context.watch<CartCubit>();
              if (state is CartLoading) {
                return SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ));
              } else if (state is CartLoaded) {
                return CustomSliverGrid(
                  products: cubit.carts,
                );
              } else if (state is CartNon) {
                return SliverFillRemaining(
                  child: NoCarts(),
                );
              } else {
                return SliverFillRemaining(
                  child: Text("error"),
                );
              }
            },
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
        child: CustomButton(
          name: "Checkout",
          onPressed: () {
            Navigator.pushNamed(context, SelectAddressPage.id);
          },
        ),
      ),
    );
  }
}
