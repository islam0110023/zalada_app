import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/widget/custom_product.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';

class CustomListViewProduct extends StatelessWidget {
  const CustomListViewProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit=BlocProvider.of<HomeCubit>(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r,vertical: 20),
        child: SizedBox(
          height: 220.h,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: cubit.products.length,
            itemBuilder: (context, index) {
              return CustomProduct(productModel: cubit.products[index],);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 10.w,
              );
            },
          ),
        ),
      ),
    );
  }
}
