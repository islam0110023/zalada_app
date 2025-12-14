import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/core/widget/custom_text_input.dart';

class AddNewPayment extends StatefulWidget {
  const AddNewPayment({super.key});
  static const id = 'AddNewPayment';

  @override
  State<AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  TextEditingController controller = TextEditingController(text: 'Bryan Adam');

  TextEditingController controller1 =
      TextEditingController(text: '2727 8907 1278 3726');

  TextEditingController controller2 = TextEditingController(text: '10/26');

  TextEditingController controller3 = TextEditingController(text: '778');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(
      () {
        setState(() {});
      },
    );
    controller1.addListener(
      () {
        setState(() {});
      },
    );
    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF293547),
        leadingWidth: 90,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Add New Card',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.primaryColor,
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
                  side: BorderSide(width: 1.r, color: const Color(0xFF4B5769)),
                  borderRadius: BorderRadius.circular(34.r),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
              )),
        ),
      ),
      backgroundColor: const Color(0xFF293547),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 583.h,
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  CustomTextInput(
                    label: 'Card Name',
                    hint: 'Card Name',
                    controller: controller,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextInput(
                    maxLength: 16,
                    label: 'Card Number',
                    hint: 'Card Number',
                    controller: controller1,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextInput(
                          readOnly: true,
                          onPressed: () {
                            showDatePicker(context: context, firstDate: DateTime.now(),lastDate: DateTime(2031, 2, 26)).then((value) {
                              controller2.text="${value!.month.toString().padLeft(2,"0")}/${value.year.toString().substring(2)}";
                            },);
                          },
                          label: 'Expiry Date',
                          hint: 'Expiry Date',
                          controller: controller2,
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: CustomTextInput(
                          maxLength: 3,
                          label: 'CVV',
                          hint: 'CVV',
                          controller: controller3,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: Container(
              width: 335.w,
              height: 215.h,
              padding: EdgeInsets.all(24.r),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/Rectangle.png')),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 55.h,
            child: Text(
              'SoCard',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                height: 1.44.h,
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 120,
            child: Text(
              controller1.text,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 190.h,
            child: Text(
              'Card holder name',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                height: 1.40.h,
              ),
            ),
          ),
          Positioned(
            left: 44.w,
            top: 210.h,
            child: Text(
              controller.text,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.14.h,
              ),
            ),
          ),
          Positioned(
            left: 154.w,
            top: 190.h,
            child: Text(
              'Expiry date',
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                height: 1.40.h,
              ),
            ),
          ),
          Positioned(
            left: 154.w,
            top: 210.h,
            child: Text(
              controller2.text,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 1.14.h,
              ),
            ),
          ),
          Positioned(
              right: 44.w,
              top: 195.h,
              child: Image.asset(
                'assets/images/image 22.png',
                width: 60.w,
                height: 40.h,
              ))
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
        child: CustomButton(
          name: 'Add Payment',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    ).animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
