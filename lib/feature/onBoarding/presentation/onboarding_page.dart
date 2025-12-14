import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/constants/app_routes.dart';
import 'package:zalada_app/core/constants/data.dart';
import 'package:zalada_app/feature/onBoarding/logic/onboarding_cubit.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const id = 'OnboardingPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: () {
                context.go(AppRoutes.login);
              },
              splashColor: Colors.transparent,
              child: Text(
                'Skip',
                textAlign: TextAlign.right,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.43.h,
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<OnboardingCubit, int>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<OnboardingCubit>(context);

            return Column(
              children: [
                SizedBox(
                  height: 55.h,
                  width: double.infinity,
                ),
                Flexible(
                    child: SvgPicture.asset(
                  ListData.onboardingList[state].image,
                  width: 299.r,
                  height: 299.r,
                )),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  ListData.onboardingList[state].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColorBlack,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.21.h,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  ListData.onboardingList[state].subTitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.textColorSecond,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.43.h,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  height: 94.r,
                  width: 94.r,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          strokeAlign: 20.sp,
                          value: ListData.onboardingList[state].progress,
                          color: AppColors.containerColorOnboarding,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 62.r,
                          height: 62.r,
                          decoration: ShapeDecoration(
                            color: AppColors.containerColorOnboarding,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.r),
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (state == 2) {
                               context.go(AppRoutes.login);
                              } else {
                                cubit.increment();
                              }
                            },
                            textColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(180.r)),
                            child: const Icon(CupertinoIcons.arrow_right),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms)
        .slideX(begin: -1, end: 0, duration: 600.ms);
  }
}
