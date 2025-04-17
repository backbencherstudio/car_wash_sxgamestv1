import 'package:car_wash/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../src/feature/splash_screen/splash_screen.dart';



class RouteConfig{
 GoRouter goRouter = GoRouter(
     initialLocation: RouteName.splashScreen,
     routes: [
      GoRoute(
          name: RouteName.splashScreen,
          path: RouteName.splashScreen,
          pageBuilder: (context, state) {
           return const MaterialPage(child: SplashScreen());
          }),

     ]);
}