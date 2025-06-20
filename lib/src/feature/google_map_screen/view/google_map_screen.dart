import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/google_map_screen/riverpod/google_map_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';
import '../../service_booking_screens/riverpod/service_booking_screens_riverpod.dart';

class GoogleMapScreen extends StatelessWidget {
  GoogleMapScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 24.h,
          bottom: 32.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Consumer(
          builder: (_, ref, _) {
            final googleMapState = ref.watch(gMapRiverpod);
            final serviceBookingState = ref.read(serviceBookingRiverpod.notifier);
            return Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 14.h,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  decoration: Utils.commonBoxDecoration(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 6.w,
                    children: [
                      SvgPicture.asset(
                        AppIcons.locationIcon,
                        width: 24.w,
                        height: 24.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          googleMapState.userAddress ?? "No Address Selected",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                Utils.primaryButton(
                  onPressed: () async {
                    if(googleMapState.userAddress != null){
                      await serviceBookingState.onSelectManuallyLocation(googleMapState.userAddress!);
                      if(context.mounted){
                        context.pop();
                      }

                    }

                  },
                  text: "Confirm Location",
                ),
              ],
            );
          },
        ),
      ),
      body: Stack(
        children: [
          /// Map View
          Positioned.fill(
            child: Consumer(
              builder: (_, ref, _) {
                final googleMapNotifier = ref.read(gMapRiverpod.notifier);
                final googleMapState = ref.watch(gMapRiverpod);
                return GoogleMap(
                  onMapCreated: googleMapNotifier.moveToUserLocation,
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 1,
                  ),
                  markers:
                      googleMapState.selectedMarker != null
                          ? {googleMapState.selectedMarker!}
                          : {},
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onTap: googleMapNotifier.onSelectPointFromMap,
                  padding: EdgeInsets.only(top: 45.h,right: 20.w),
                  buildingsEnabled: true,
                  compassEnabled: true,
                  fortyFiveDegreeImageryEnabled: true,
                  mapToolbarEnabled: true,
                  trafficEnabled: true,
                 mapType: MapType.satellite,

                );
              },
            ),
          ),

          /// Home header
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20),
              child: Utils.backButton(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
