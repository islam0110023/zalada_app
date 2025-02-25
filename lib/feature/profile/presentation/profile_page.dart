import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/constants/app_colors.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/profile/presentation/edit_profile.dart';
import 'package:zalada_app/feature/profile/presentation/payment_method_page.dart';
import 'package:zalada_app/feature/profile/presentation/widget/custom_list_profile.dart';

class ProfilePage extends StatefulWidget {
  const  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isActive=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'Profile',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.textColorBlack,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            height: 1.44.h,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EditProfile.id);
            },
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
                  Icons.person_add_alt_1_outlined,
                  color: AppColors.obscureColor,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(180.r),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                width: 100.r,
                height: 100.r,
              ),
            ),
            SizedBox(
              height: 16.h,
              width: double.infinity,
            ),
            Text(
              'Bryan Adam',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColorBlack,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.44.h,
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'bryan.adam87@gmail.com',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                color: AppColors.textColorSecond,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                height: 1.43.h,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              decoration: ShapeDecoration(
                color: Colors.white,
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
                  FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4,
                      margin: EdgeInsets.symmetric(vertical: 24.r),
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                  ),
                  Text(
                    'Account Settings',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorSecond,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Address",
                      onTap: () {},
                      icon: Icons.location_on_outlined),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                    name: "Payment Method",
                    onTap: () {
                      Navigator.pushNamed(context, PaymentMethodPage.id);
                    },
                    icon: Icons.credit_card,

                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Notification",
                      onTap: () {},
                      icon: Icons.notifications_none_rounded,
                    widget: Switch(
                      value: isActive,
                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.white,
                      focusColor: Colors.white,
                      activeTrackColor: Color(0xff34C759),


                      onChanged: (value) {
                        isActive=value;
                        setState(() {

                        });
                      },
                    ),),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Account Security",
                      onTap: () {},
                      icon: Icons.verified_user),
                  FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4,
                      margin: EdgeInsets.symmetric(vertical: 24.r),
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                  ),
                  Text(
                    'General',
                    style: GoogleFonts.plusJakartaSans(
                      color: AppColors.textColorSecond,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.43.h,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Invite Friends",
                      onTap: () {},
                      icon: Icons.supervised_user_circle),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Privacy Policy",
                      onTap: () {},
                      icon: CupertinoIcons.lock),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListProfile(
                      name: "Help Center",
                      onTap: () {},
                      icon: CupertinoIcons.info_circle),
                  FractionallySizedBox(
                    widthFactor: 2,
                    child: Container(
                      width: double.infinity,
                      height: 4,
                      margin: EdgeInsets.symmetric(vertical: 24.r),
                      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CacheHelper.removeData(key: "token");
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        LoginPage.id,
                        (route) => false,
                      );
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
                      title: Text(
                        "Logout",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppColors.logoutColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.50.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
