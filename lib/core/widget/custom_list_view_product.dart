import 'package:carousel_slider/carousel_slider.dart';
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
    var cubit = BlocProvider.of<HomeCubit>(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20),
        child: SizedBox(
          height: 220.h,
          child: CarouselSlider.builder(
              itemCount: cubit.products.length,
              itemBuilder: (context, index, realIndex) {
                return CustomProduct(
                  productModel: cubit.products[index],
                );
              },
              options: CarouselOptions(
                height: 220.h,
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
      ),
    );
  }
}
