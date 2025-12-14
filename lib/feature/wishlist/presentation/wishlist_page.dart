import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_sliver_grid.dart';
import 'package:zalada_app/feature/wishlist/logic/wishlist_cubit.dart';
import 'package:zalada_app/feature/wishlist/presentation/widget/no_favorite.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: SizedBox(
          height: 56.h,
        )),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Text(
              'Your Wishlist',
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
        BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            final cubit = context.watch<WishlistCubit>();
            if (state is FavoriteLoading) {
              return const SliverFillRemaining(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (state is FavoriteLoaded) {
              return CustomSliverGrid(
                products: cubit.favorites,
              );
            } else if(state is FavoriteNon) {
              return const SliverFillRemaining(
                child: NoFavorite(),
              );
            }
            else {
              return const SliverFillRemaining(
                child: Text('error'),
              );
            }
          },
        )
      ],
    );
  }
}
