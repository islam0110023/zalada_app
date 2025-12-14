import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_list_view_product.dart';
import 'package:zalada_app/core/widget/custom_sliver_grid.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';
import 'package:zalada_app/feature/home/presentation/widget/custom_home_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400.h,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    height: 321.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFFD6C8A),
                          Color(0xFFFDA46B),
                          Color(0xFFFEB5AE),
                          Color(0xFFFBCCDC),
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(28.r),
                        child: Image.asset(
                          'assets/images/Background.png',
                          width: 335.w,
                          height: 178.h,
                        ))),
                Positioned(
                  top: 48.h,
                  child: SizedBox(
                      width: ScreenUtil().screenWidth,
                      child: const CustomHomeListTile()),
                ),
                Positioned(
                  top: 116.h,
                  left: 20.w,
                  child: SizedBox(
                    width: ScreenUtil().screenWidth,
                    child: Text(
                      'Find best device for your setup!',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primaryColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.12.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 238.h,
                  left: 44.w,
                  child: SizedBox(
                    width: 156.w,
                    child: Text(
                      'New Bing Wireless Earphone',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.primaryColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.07.h,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 344.h,
                  left: 44.w,
                  child: Text(
                    'See Offer',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 1.50.h,
                    ),
                  ),
                ),
                Positioned(
                    top: 348.h,
                    left: 130.w,
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: AppColors.primaryColor,
                    )),
                Positioned(
                  top: 235,
                  left: 230,
                  child: Image.asset(
                    'assets/images/Image (2).png',
                    width: 130.9.w,
                    height: 220.32.h,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hot deals🔥',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColorBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.44.h,
                  ),
                ),
                SizedBox(
                  width: 96.w,
                  height: 24.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: ShapeDecoration(
                          color: AppColors.containerColorThree,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: Text(
                          '02',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF292A2E),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.50.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const Text(
                        ':',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: ShapeDecoration(
                          color: AppColors.containerColorThree,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: Text(
                          '12',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF292A2E),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.50.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      const Text(
                        ':',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: ShapeDecoration(
                          color: AppColors.containerColorThree,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r)),
                        ),
                        child: Text(
                          '00',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF292A2E),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            height: 1.50.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeProductLoading) {
              return const SliverFillRemaining(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            } else if (state is HomeProductLoaded) {
              return const CustomListViewProduct();
            } else if (state is HomeProductFailure) {
              return SliverFillRemaining(
                child: Text(state.error),
              );
            } else {
              return const SliverFillRemaining(
                child: Text('error'),
              );
            }
          },
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 5.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Text(
              'Categories',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColorBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.44.h,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.center,
            dividerColor: Colors.transparent,
            labelStyle: GoogleFonts.plusJakartaSans(
              color: AppColors.primaryColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.29.h,
            ),
            unselectedLabelStyle: GoogleFonts.plusJakartaSans(
              color: AppColors.textColorBlack,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              height: 1.29.h,
            ),
            splashBorderRadius: BorderRadius.circular(30.r),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                width: 1,
                color: const Color(0xFFE9EBF0),
              ),
              color: AppColors.containerColorOnboarding,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F264462),
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color(0x0F0C253E),
                  blurRadius: 32,
                  offset: Offset(0, 20),
                  spreadRadius: 0,
                )
              ],
            ),
            labelPadding: EdgeInsets.fromLTRB(4.r, 4.r, 20.r, 4.r),
            controller: tabController,
            tabs: [
              Row(
                children: [
                  Container(
                      width: 32.w,
                      height: 32.h,
                      padding: EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: AppColors.textColorBlack,
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text('All')
                ],
              ),
              Row(
                children: [
                  Container(
                      width: 32.w,
                      height: 32.h,
                      padding: EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: AppColors.textColorBlack,
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text('Laptop')
                ],
              ),
              Row(
                children: [
                  Container(
                      width: 32.w,
                      height: 32.h,
                      padding: EdgeInsets.all(4.r),
                      decoration: ShapeDecoration(
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: AppColors.textColorBlack,
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text('Accessories')
                ],
              ),
            ],
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<HomeCubit>(context);

            if (state is HomeProductLoading) {
              return const SliverFillRemaining(
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
