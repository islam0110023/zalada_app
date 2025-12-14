import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zalada_app/core/constants/app_routes.dart';
import 'package:zalada_app/core/db/cache_helper/cache_helper.dart';
import 'package:zalada_app/core/db/db_helper/local_db_helper.dart';
import 'package:zalada_app/core/network/dio_helper.dart';
import 'package:zalada_app/feature/cart/logic/cart_cubit.dart';
import 'package:zalada_app/feature/wishlist/logic/wishlist_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  await SQLHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CartCubit()..loadedCart()),
          BlocProvider(
            create: (context) => WishlistCubit()..loadFavorites(),
          ),
        ],
        child: MaterialApp.router(
          builder: (context, child) {
            return Container(
              color: Colors.white,
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes.router,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  surfaceTintColor: Colors.white)),
        ),
      ),
    );
  }
}
