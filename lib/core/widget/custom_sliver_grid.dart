import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/model/product_model.dart';
import 'package:zalada_app/core/widget/custom_product.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:  EdgeInsets.only(left: 20.r,right: 20.r,bottom: 20.r),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 159.w/230.h,
        ),
        itemBuilder: (context, index) {
          return CustomProduct(productModel: products[index],);
        },
      ),
    );
  }
}
