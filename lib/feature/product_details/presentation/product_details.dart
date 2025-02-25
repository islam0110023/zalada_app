import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/model/favorite_model_db.dart';
import 'package:zalada_app/core/model/product_model.dart';
import 'package:zalada_app/core/widget/custom_button.dart';
import 'package:zalada_app/feature/product_details/logic/product_details_cubit.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const id = "ProductDetails";

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as Product;
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..loadFavorites(),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ProductDetailsCubit>(context);
          bool isFav = cubit.isFavorite(product.id.toString());
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
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
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
                    padding: EdgeInsets.all(12.r),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.r, color: AppColors.borderColor),
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
                    FavoriteModelDb favProduct = FavoriteModelDb(
                        id: product.id,
                        title: product.title,
                        price: product.price,
                        image: product.image,
                        description: product.description);
                    cubit.addAndRemoveFavorite(favProduct);
                  },
                  borderRadius: BorderRadius.circular(34.r),
                  child: Container(
                      alignment: Alignment.center,
                      width: 44.r,
                      height: 44.r,
                      margin:
                          EdgeInsets.symmetric(horizontal: 15.r, vertical: 6.r),
                      padding: EdgeInsets.all(10.r),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.r, color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(34.r),
                        ),
                      ),
                      child: isFav
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: AppColors.obscureColor,
                            )),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r),
                child: Column(
                  children: [
                    SizedBox(
                      width: 253.w,
                      child: Text(
                        product.title!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.25.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                      width: double.infinity,
                    ),
                    Text(
                      '\$${product.price}',
                      style: GoogleFonts.plusJakartaSans(
                        color: AppColors.textColorThree,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        height: 1.20.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CachedNetworkImage(
                      imageUrl: product.image!,
                      height: 300.r,
                      width: 300.r,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    FractionallySizedBox(
                      widthFactor: 2,
                      child: Container(
                        width: double.infinity,
                        height: 4.h,
                        margin: EdgeInsets.symmetric(vertical: 24.r),
                        decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Product Description',
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.44.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.start,
                        product.description!,
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.textColorSecond,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.43.h,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 112.h,
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
                shadows: [
                  BoxShadow(
                    color: Color(0x32576F85),
                    blurRadius: 32,
                    offset: Offset(0, -1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 56.r,
                    height: 56.r,
                    padding: EdgeInsets.all(16.r),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.r, color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(34.r),
                      ),
                    ),
                    child: Icon(
                      CupertinoIcons.bag,
                      color: AppColors.obscureColor,
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: CustomButton(
                      name: "Checkout",
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
