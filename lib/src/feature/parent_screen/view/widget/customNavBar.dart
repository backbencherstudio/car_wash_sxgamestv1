import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

final bottomNavProvider = StateProvider<int>((ref) => 0);

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final notifier = ref.read(bottomNavProvider.notifier);

    final items = [
      {'icon': 'assets/icons/home.svg', 'label': 'Home'},
      {'icon': 'assets/icons/heart.svg', 'label': 'Favorites'},
      {'icon': 'assets/icons/heartbroken.svg', 'label': 'Services'},
      {'icon': 'assets/icons/pp.svg', 'label': 'Profile'},
    ];

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
       margin: AppPadding.screenHorizontal,
        decoration: Utils.commonBoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isActive = index == currentIndex;
      
            return AnimatedScale(
              scale: isActive ? 1.1 : 1.0, 
              duration: Duration(milliseconds: 500),
              curve: Curves.elasticOut, 
              child: ElevatedButton(
                
                onPressed: () => notifier.state = index,
                style: ElevatedButton.styleFrom(
            
                  enableFeedback: false,
                  overlayColor: Colors.transparent, // this one for fade effect
                  shadowColor: Colors.transparent,  // this one is also for the fade effect
                  surfaceTintColor: Colors.transparent,
            
            
                  backgroundColor: isActive ? AppColors.primary : Colors.transparent, 
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
              ),
            );
          }),
        ),
      ),
    );
  }
}
