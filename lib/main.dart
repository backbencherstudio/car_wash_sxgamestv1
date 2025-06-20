import 'package:car_wash/core/services/local_storage_services/hive_services.dart';
import 'package:car_wash/core/services/payment_services/stripe_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:car_wash/core/theme/theme.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as gps;
import 'core/routes/route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await StripeServices.instance.initialize();
  await HiveSecureStorageService.init();

  ///set device orientation to portraitUp during app running for better user experience of the UI
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  ///ensuring screen size for screen util package to implement pixel perfect UI
  await ScreenUtil.ensureScreenSize();

  LocationPermission locationPermission = await Geolocator.checkPermission();
  if (locationPermission == LocationPermission.denied ||
      locationPermission == LocationPermission.deniedForever) {
    debugPrint(
      "\nLocation permission is denied. Asking for location permission.\n",
    );

    /// if denied then ask permission
    locationPermission = await Geolocator.requestPermission();
  }

  bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!isServiceEnabled) {
    debugPrint(
      "\nLocation service is not enabled. Opening location settings.\n",
    );
    gps.Location().requestService();
  }

  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      systemNavigationBarColor: Colors.transparent, // Transparent nav bar
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const double deviceWidth = 440.0;
  static const double deviceHeight = 977.0;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(deviceWidth, deviceHeight),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'CARFLIX',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
          routerConfig: RouteConfig().goRouter,
        );
      },
    );
  }
}
