import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            CacheHelper.removeData(key: "token");
            Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false,);
          },
          child: ListTile(
            leading: Container(
              width: 44.w,
              height: 44.h,
              decoration: ShapeDecoration(
                color: AppColors.containerColorSecond,
                shape: OvalBorder(),
              ),
              child: Icon(
                Icons.logout_rounded,
                color: AppColors.logoutColor,
              ),
            ),
            title: Text("Logout",style: GoogleFonts.plusJakartaSans(
              color: AppColors.logoutColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              height: 1.50.h,
            ),),
          ),
        )
      ],
    );
  }
}
