import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';

import '../../feature/auth/logic/auth_cubit.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      required this.label,
      required this.hint,
      this.isPass = false,
      required this.controller,
      required this.onTap,
      this.isEmail = true});
  final String label;
  final String hint;
  final bool isEmail;
  final bool isPass;
  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorSecond,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            height: 1.33.h,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextFormField(
          obscureText:isPass,
          cursorColor: AppColors.hintColor,
          controller: controller,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 1.50.h,
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(16),
              suffixIcon: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: onTap,
                child: isEmail == false
                    ?isPass == false
                        ? Icon(
                            CupertinoIcons.eye,
                            color: AppColors.obscureColor,
                            size: 24,
                          )
                        : Icon(
                            CupertinoIcons.eye_slash,
                            color: AppColors.obscureColor,
                            size: 24,
                          )
                    : Text(""),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: AppColors.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(
                  width: 1.w,
                  color: AppColors.borderColor,
                ),
              ),
              hintText: hint,
              hintStyle: GoogleFonts.plusJakartaSans(
                color: AppColors.hintColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.50.h,
              )),
        ),
      ],
    );
  }
}
