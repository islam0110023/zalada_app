import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/core/widget/custom_text_input.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  static const id = "EditProfile";
  TextEditingController controller = TextEditingController(text: "Bryan Adam");
  TextEditingController controller1 = TextEditingController(text: "12 / 12 / 1994");
  TextEditingController controller2 = TextEditingController(text: "bryan.adam83@gmail.com");
  TextEditingController controller3 = TextEditingController(text: "812 788 61 1672");
  TextEditingController controller4 = TextEditingController(text: "Male");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Edit Profile',
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
                  side: BorderSide(width: 1.r, color: AppColors.borderColor),
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
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(180.r),
              child: Container(
                width: 100.r,
                height: 100.r,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                ))),
                child: Text(
                  'Edit',
                  style: GoogleFonts.plusJakartaSans(
                    color: AppColors.primaryColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.33.h,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomTextInput(
              label: "FullName",
              hint: "Name",
              controller: controller,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              label: "Date of Birth",
              hint: "Name",
              controller: controller1,

              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              label: "Email Address",
              hint: "Name",
              controller: controller2,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              label: "Phone Number",
              hint: "Name",
              controller: controller3,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextInput(
              label: "Gender",
              hint: "Name",
              controller: controller4,
              onTap: () {},
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r,vertical: 10.r),
        child: CustomButton(name: "Save Change", onPressed: () {

        },),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
