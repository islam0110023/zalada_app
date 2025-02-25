import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/model/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const id = "ProductDetails";

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        toolbarHeight: 70,
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
        actions: [
          InkWell(
            onTap: () {
            },
            borderRadius: BorderRadius.circular(34.r),

            child: Container(
              alignment: Alignment.center,
                width: 44.r,
                height: 44.r,
                margin: EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
                padding: EdgeInsets.all(10.r),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.r, color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(34.r),
                  ),
                ),
                child: Icon(
                  Icons.favorite_outline,
                  color: AppColors.obscureColor,
                )),
          )
        ],

      ),
      body: Column(

      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
