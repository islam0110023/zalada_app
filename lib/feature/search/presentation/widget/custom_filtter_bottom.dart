import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/widget/custom_button.dart';

class CustomFilterBottom extends StatefulWidget {
  const CustomFilterBottom({super.key});

  @override
  State<CustomFilterBottom> createState() => _CustomFilterBottomState();
}

class _CustomFilterBottomState extends State<CustomFilterBottom> {
  RangeValues values = const RangeValues(100, 900);
  double _lowerValue = 200;
  double _upperValue = 1500;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 388.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 66.67.w,
              height: 4.h,
              margin: EdgeInsets.all(10.r),
              decoration: ShapeDecoration(
                color: Colors.black.withAlpha(55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.r),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.44.h,
                ),
              ),
              Text(
                'Reset',
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textColorThree,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.43.h,
                ),
              )
            ],
          ),
          FractionallySizedBox(
            widthFactor: 1.5,
            child: Container(
              width: 375,
              margin: EdgeInsets.symmetric(vertical: 24.r),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFEAEAEA),
                  ),
                ),
              ),
            ),
          ),
          Text(
            'Price range',
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.textColorBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              height: 1.44.h,
            ),
          ),
          FlutterSlider(
            values: [_lowerValue, _upperValue],
            rangeSlider: true,
            min: 50,
            max: 2500,
            handlerHeight: 50,
            handlerWidth: 20,
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color: AppColors.sliderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              inactiveTrackBar: BoxDecoration(
                color: AppColors.borderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              activeTrackBarHeight: 5,
            ),
            tooltip: FlutterSliderTooltip(
              alwaysShowTooltip: true,
              positionOffset: FlutterSliderTooltipPositionOffset(top: 80),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            handler: FlutterSliderHandler(
              child: Icon(
                Icons.circle_outlined,
                color: AppColors.sliderColor,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
            ),
            rightHandler: FlutterSliderHandler(
              child: Icon(
                Icons.circle_outlined,
                color: AppColors.sliderColor,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primaryColor),
            ),
            onDragging: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                _lowerValue = lowerValue;
                _upperValue = upperValue;
              });
            },
          ),
          SizedBox(height: 40.h,),
          CustomButton(name: 'Apply filter', onPressed: () {
            Navigator.pop(context);

          },)
        ],
      ),
    );
  }
}
