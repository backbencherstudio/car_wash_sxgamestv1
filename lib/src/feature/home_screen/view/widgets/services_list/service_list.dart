import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/home_screen/riverpod/home_riverpod.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../model/service_list_model.dart';

class ServicesList extends StatefulWidget {

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
          height: 330.h,
            width: 400.w,
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
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 12.h,
                                  children: [
                                    Utils.secondaryButton(
                                        onPressed: (){},
                                        imageAsset: service.iconPath,
                                        context: context,
                                      backgroundColor: Color.fromRGBO(0, 124, 240, 0.08),
                                      iconColor: AppColors.primary
                                    ),
                                    Text(service.serviceName,style: textStyle,)
                                  ],
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
