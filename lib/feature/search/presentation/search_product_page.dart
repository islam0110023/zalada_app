import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_sliver_grid.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';
import 'package:zalada_app/feature/search/presentation/widget/custom_filtter_bottom.dart';

class SearchProductPage extends StatelessWidget {
  SearchProductPage({super.key});

  static const id = "SearchProductPage";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    controller.text = name;
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              leadingWidth: 90,
              titleSpacing: 0,
              toolbarHeight: 70,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 44.r,
                    height: 44.r,
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
                    padding: EdgeInsets.all(12.r),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.r, color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(34.r),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.obscureColor,
                    )),
              ),
              title: Padding(
                padding: EdgeInsets.only(right: 15.r),
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.r, vertical: 10.r),
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
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Result for ”$name”",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorSecond,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    ),
                    Text(
                      "20 founds",
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorThree,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.43.h,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
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
        ),
        extendBody: true,
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 80,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 1.00),
              end: Alignment(0, -1),
              colors: [Color(0xFFFEFEFE), Color(0x00FEFEFE)],
            ),
          ),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                transitionAnimationController: AnimationController(
                  vsync: Navigator.of(context),
                  duration: Duration(milliseconds: 999),
                  reverseDuration: Duration(milliseconds: 999),
                ),
                builder: (context) {
                  return CustomFilterBottom()
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 1, end: 0, duration: 600.ms);
                },
              );
            },
            child: Container(
              width: 119.w,
              height: 52.h,
              padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 14.r),
              decoration: ShapeDecoration(
                color: AppColors.containerColorOnboarding,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3D576F85),
                    blurRadius: 24.r,
                    offset: Offset(0, 12),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_alt,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Filter',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.50.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
