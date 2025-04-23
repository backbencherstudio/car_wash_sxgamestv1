import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => notifier.state = index,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: isActive ? 16 : 0, vertical: 10),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    items[index]['icon']!,
                    colorFilter: ColorFilter.mode(
                      isActive ? Colors.white : Colors.black54,
                      BlendMode.srcIn,
                    ),
                    height: 24,
                    width: 24,
                  ),
                  if (isActive)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        items[index]['label']!,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}