import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/core/widget/custom_text_input.dart';
import 'package:zalada_app/feature/auth/logic/auth_cubit.dart';
import 'package:zalada_app/feature/auth/presentation/register_page.dart';
import 'package:zalada_app/feature/auth/presentation/widget/custom_bottom_sheet.dart';
import 'package:zalada_app/feature/home/presentation/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static const id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginLoaded) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Success Login")));

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.id,
                  (route) => false,
                );
              }
              if (state is LoginLoading) {
                isLoading = true;
                setState(() {});
              }
              if (state is LoginFailure) {
                isLoading = false;
                setState(() {});
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            builder: (context, state) {
              var cubit = BlocProvider.of<AuthCubit>(context);
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: SingleChildScrollView(
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
                              color: Colors.black,
                              fontSize: 32.sp,
                              height: 1.12.h,
                              fontWeight: FontWeight.w600,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText("Login to your\naccount.",
                                    speed: Duration(milliseconds: 100)),
                              ],
                              repeatForever: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomTextInput(
                          label: "Email Address",
                          hint: "Email address",
                          controller: emailController,
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextInput(
                          label: "Password",
                          hint: "Password",
                          controller: passwordController,
                          isPass: cubit.isPass,
                          isEmail: false,
                          onTap: () {
                            cubit.obscureText();
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                transitionAnimationController:
                                    AnimationController(
                                  vsync: Navigator.of(context),
                                  duration: Duration(milliseconds: 999),
                                  reverseDuration: Duration(milliseconds: 999),
                                ),
                                builder: (context) {
                                  return CustomBottomSheet()
                                      .animate()
                                      .fade(duration: 999.ms)
                                      .slideY(begin: 1, end: 0, duration: 800.ms);
                                },
                              );
                            },
                            child: Text(
                              "Forget password?",
                              style: GoogleFonts.plusJakartaSans(
                                color: AppColors.textColorBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.50.h,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButton(
                          name: "Login",
                          onPressed: () {
                            cubit.login(
                                userName: emailController.text,
                                password: passwordController.text);
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
                              "or continue with",
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
                              Navigator.pushReplacementNamed(
                                  context, RegisterPage.id);
                            },
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.plusJakartaSans(
                                  color: Color(0xFF7C7D81),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.50.h,
                                ),
                              ),
                              TextSpan(
                                  text: "Register",
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
              );
            },
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
