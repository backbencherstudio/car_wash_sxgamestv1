import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends ConsumerStatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final parentScreenNotifier = ref.read(parentsScreenProvider.notifier);
    final parentScreenState = ref.watch(parentsScreenProvider);

    final items = [
      {'icon': 'assets/icons/home.svg', 'label': 'Home'},
      {'icon': 'assets/icons/heart.svg', 'label': 'Favorites'},
      {'icon': 'assets/icons/heartbroken.svg', 'label': 'Services'},
      {'icon': 'assets/icons/pp.svg', 'label': 'Profile'},
    ];

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        margin: AppPadding.screenHorizontal,
        decoration: Utils.commonBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isActive = index == parentScreenState.selectedIndex;

            return ElevatedButton(
              /// Only assign key to the first button
              onPressed: () {
                parentScreenNotifier.onPageChange(index: index);
              },
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                overlayColor: Colors.transparent, // this one for fade effect
                shadowColor:
                    Colors.transparent, // this one is also for the fade effect
                surfaceTintColor: Colors.transparent,

                backgroundColor:
                    isActive ? AppColors.primary : Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: isActive ? 10 : 0,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                spacing: 8.w,
                children: [
                  SvgPicture.asset(
                    items[index]['icon']!,
                    colorFilter: ColorFilter.mode(
                      isActive ? Colors.white : Colors.black54,
                      BlendMode.srcIn,
                    ),
                    height: 24.h,
                    width: 24.w,
                  ),
                  if (isActive)
                    Text(
                      items[index]['label']!,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
