import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/feature/auth/presentation/login_page.dart';
import 'package:zalada_app/feature/cart/presentation/cart_page.dart';
import 'package:zalada_app/feature/home/logic/home_cubit.dart';
import 'package:zalada_app/feature/home/presentation/home_screen.dart';
import 'package:zalada_app/feature/profile/presentation/profile_page.dart';
import 'package:zalada_app/feature/search/presentation/search_page.dart';
import 'package:zalada_app/feature/wishlist/presentation/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> pages = [
    HomeScreen(),
    SearchPage(),
    WishlistPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: Scaffold(
        body: pages[index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            index = value;
            setState(() {});
          },
          currentIndex: index,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: Color(0xFF989E9F),
          selectedItemColor: Color(0xFF2D3B51),
          selectedLabelStyle: GoogleFonts.plusJakartaSans(
            color: Color(0xFF2D3B51),
            fontSize: 11,
            fontWeight: FontWeight.w700,
          ),
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: GoogleFonts.plusJakartaSans(
            color: Color(0xFF989E9F),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.house_fill), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bag), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person), label: "Profile"),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1500.ms)
        .slideX(begin: -1, end: 0, duration: 800.ms);
  }
}
