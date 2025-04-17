import 'package:flutter/material.dart';

import 'core/routes/route_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Car Wash',
      debugShowCheckedModeBanner: false,
      routerConfig: RouteConfig().goRouter,
    );
  }
}
