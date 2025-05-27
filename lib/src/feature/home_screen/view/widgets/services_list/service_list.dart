import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../riverpod/home_riverpod.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final subTitleTextTheme = textTheme.bodyMedium?.copyWith(
      color: Color(0xff444950),
      fontWeight: FontWeight.w500,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Text("Offered services", style: textTheme.titleSmall),
        Container(
          width: 400.w,
          height: 144.h,
          padding: EdgeInsets.all(16.r),
          decoration: Utils.commonBoxDecoration(),

          child: Consumer(
            builder: (_, ref, _) {
              final homeNotifier = ref.read(homeRiverpod.notifier);
              return ListView.builder(
                itemCount: homeNotifier.dummyServiceList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final service = homeNotifier.dummyServiceList[index];
                  return Container(
                    width: 155.w,
                    height: 112.h,
                    margin: EdgeInsets.only(right: 12.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 124, 240, 0.08),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          service["iconPath"],
                          width: 32.w,
                          height: 32.h,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),

                        Text(service["serviceName"], style: subTitleTextTheme),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
