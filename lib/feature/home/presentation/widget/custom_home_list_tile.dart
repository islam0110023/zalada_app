import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/feature/home/presentation/notification_page.dart';

class CustomHomeListTile extends StatelessWidget {
  const CustomHomeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Container(
        width: 44.r,
        height: 44.r,
        padding: EdgeInsets.all(10.r),
        decoration: ShapeDecoration(
          color:
          AppColors.primaryColor.withOpacity(0.20000000298023224),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34.r),
          ),
        ),
        child: Icon(
          Icons.location_on_sharp,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        "Location",
        style: GoogleFonts.plusJakartaSans(
          color:
          AppColors.primaryColor.withOpacity(0.8999999761581421),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 1.33.h,
        ),
      ),
      subtitle: Text(
        "Condong Catur",
        style: GoogleFonts.plusJakartaSans(
          color: AppColors.primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          height: 1.43.h,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, NotificationPage.id);
            },
            child: Container(
              width: 44.r,
              height: 44.r,
              padding: EdgeInsets.all(10.r),
              decoration: ShapeDecoration(
                color: AppColors.primaryColor
                    .withOpacity(0.20000000298023224),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34.r),
                ),
              ),
              child: Icon(
                Icons.notifications,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(34.r),

            child: Container(
                width: 44.r,
                height: 44.r,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(0.20000000298023224),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34.r),
                  ),
                ),
                child: Image.network(fit: BoxFit.fill,
                    "https://i0.hippopx.com/photos/711/14/431/smile-profile-face-male-preview.jpg")),
          ),
        ],
      ),
    );
  }
}
