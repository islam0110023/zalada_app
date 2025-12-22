import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/constants/app_routes.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/core/widget/custom_text_input.dart';
import 'package:zalada_app/feature/auth/logic/auth_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    final state = context.watch<AuthCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success Register')));

                  context.go(AppRoutes.login);
                }
                if (state is RegisterLoading) {}
                if (state is RegisterFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              child: Form(
                key: cubit.formKey1,
                autovalidateMode: state.autoValidateMode1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    SizedBox(
                      height: 85.h,
                      child: DefaultTextStyle(
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 32.sp,
                          height: 1.12.h,
                          fontWeight: FontWeight.w600,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText('Create your new\naccount',
                                speed: const Duration(milliseconds: 100)),
                          ],
                          repeatForever: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomTextInput(
                      label: 'User Name',
                      hint: 'User Name',
                      controller: cubit.userNameSignUpController,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextInput(
                      label: 'Password',
                      hint: 'Password',
                      controller: cubit.passwordSignUpController,
                      isPass: cubit.isPass,
                      isEmail: false,
                      onTap: () {
                        cubit.obscureText();
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomTextInput(
                      label: 'Email',
                      hint: 'Email',
                      controller: cubit.emailSignUpController,
                      isPass: false,
                      isEmail: true,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                      name: 'Register',
                      onPressed: () {
                        cubit.register();
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.borderColor,
                            thickness: 1.sp,
                          ),
                        ),
                        SizedBox(
                          width: 14.w,
                        ),
                        Text(
                          'or continue with',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppColors.textColorSecond,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.50.h,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.borderColor,
                            thickness: 1.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          context.replace(AppRoutes.login);
                        },
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: GoogleFonts.plusJakartaSans(
                              color: const Color(0xFF7C7D81),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 1.50.h,
                            ),
                          ),
                          TextSpan(
                              text: 'Login',
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textColorThree,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.50.h,
                              ))
                        ])),
                      ),
                    ),
                  ],
                ),
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
