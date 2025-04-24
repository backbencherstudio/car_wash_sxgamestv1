import 'package:car_wash/src/feature/home_screen/view/home_screen.dart';
import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:car_wash/src/feature/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:car_wash/src/feature/home_screen/view/home_screen.dart' show bottomNavVisibilityProvider;

class HomeWrapper extends ConsumerStatefulWidget {
  const HomeWrapper({super.key});

  @override
  ConsumerState<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends ConsumerState<HomeWrapper> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: ref.read(bottomNavProvider));
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(bottomNavProvider);
    final isBottomVisible = ref.watch(bottomNavVisibilityProvider); 

    // keep in sync
    ref.listen<int>(bottomNavProvider, (previous, next) {
      if (_pageController.hasClients && _pageController.page?.round() != next) {
        _pageController.jumpToPage(next);
      }
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                ref.read(bottomNavProvider.notifier).state = index;
              },
              children: const [
                HomeScreen(),
                Center(child: Text("Favorites Screen")),
                Center(child: Text("Services Screen")),
                Center(child: Text("Profile Screen")),
              ],
            ),
          ),
          if (isBottomVisible) 
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: CustomBottomNavBar(),
            ),
        ],
      ),
    );
  }
}
