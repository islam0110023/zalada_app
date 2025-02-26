import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_sliver_grid.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';
import 'package:zalada_app/feature/search/presentation/search_product_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 48.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: TextFormField(
              onFieldSubmitted: (value) {
                Navigator.pushNamed(context, SearchProductPage.id,arguments: value);

              },
              decoration: InputDecoration(
                fillColor: AppColors.primaryColor,
                filled: true,
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: AppColors.obscureColor,
                ),
                hintText: "Search laptop, headset..",
                hintStyle: GoogleFonts.plusJakartaSans(
                  color: AppColors.hintColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.50.h,
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(34.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(34.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.r, color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(34.r),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 12.h,
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit=BlocProvider.of<HomeCubit>(context);

            if (state is HomeProductLoading) {
              return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            } else if (state is HomeProductLoaded) {
              return CustomSliverGrid(
                products: cubit.products,
              );
            } else if (state is HomeProductFailure) {
              return SliverFillRemaining(
                child: Text(state.error),
              );
            } else {
              return SliverFillRemaining(
                child: Text("error"),
              );
            }
          },
        )
      ],
    );
  }
}
