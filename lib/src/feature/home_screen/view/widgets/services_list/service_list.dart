import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/home_screen/riverpod/home_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../model/service_list_model.dart';
import '../../../../demo_google_map_screen/view/demo_google_map_screen.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({super.key});


  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  late final PageController _servicePageController;

  @override
  void initState() {
    _servicePageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _servicePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Text(
          "Services",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 18.sp,
            color: AppColors.textColor,
            fontWeight: FontWeight.w700
          ),
        ),
        Container(
            width: 400.w,
            height: MediaQuery.of(context).size.height > 700 ?  335.h : 370.h,
           padding: EdgeInsets.only(bottom:  16.h),
          decoration: Utils.commonBoxDecoration(),

          child: Consumer(
            builder: (_, ref, _){
              final homeState = ref.watch(homeRiverpod);
              final List<ServiceItemModel> serviceItems = homeState.serviceItem ?? [];

              // Break into pages of 6
              final pages = <List<ServiceItemModel>>[];
              for (int i = 0; i < serviceItems.length; i += 6) {
                pages.add(serviceItems.sublist(
                  i,
                  (i + 6 > serviceItems.length) ? serviceItems.length : i + 6,
                ));
              }

              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16.h,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _servicePageController,
                        itemCount: pages.length,
                        onPageChanged: (index){
                          ref.read(homeRiverpod.notifier).onServicesPageChange(index: index);
                        },
                        itemBuilder: (_, pageIndex){
                        final pageItems = pages[pageIndex];
                        return  GridView.count(
                          crossAxisCount: 3,
                            padding: EdgeInsets.all(16.r),
                            crossAxisSpacing: 16..w,
                            mainAxisSpacing: 24.h,
                                physics: NeverScrollableScrollPhysics(),

                                children: pageItems.map((service){
                                TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!;
                                return SizedBox(
                                  width: 112.w,
                                  height: 106.h,
                                  child: FittedBox(
                                    child: Utils.secondaryButton(
                                        onPressed: (){
                                          debugPrint("\nservice list button pressed\n");
                                          context.push(RouteName.googleMapScreen);
                                          },
                                        imageAsset: service.iconPath,
                                        context: context,
                                      backgroundColor: Color.fromRGBO(0, 124, 240, 0.08),
                                      iconColor: AppColors.primary,
                                      buttonName: service.serviceName,
                                      buttonNameTextStyle: textStyle
                                    ),
                                  ),
                                );
                          }).toList());
                        }
                    ),
                  ),
                  DotsIndicator(
                      dotsCount: pages.length,
                    position: homeState.currentServiceItemPage.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: AppColors.primary,
                      color: Color(0xffE9E9E9),
                      size: Size(8.w,8.h),
                      activeSize: Size(19.w,8.h),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      shape: CircleBorder(),
                    ),
                  )
                ],
              );

            },
          )

        ),
      ],
    );
  }
}
