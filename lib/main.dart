import 'package:car_wash/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const double deviceWidth = 402.0;
  static const double deviceHeight = 874.0;
  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context,child){
        return MaterialApp.router(
          title: 'Car Wash',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: RouteConfig().goRouter,
        );

      },
    );
  }
}
