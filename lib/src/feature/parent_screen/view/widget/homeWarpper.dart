import 'package:car_wash/src/feature/home_screen/view/home_screen.dart';
import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:car_wash/src/feature/profile_Create_screen/view/profile_screen.dart';
import 'package:car_wash/src/feature/profile_screen/view/profile_screen.dart';
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
    // ignore: unused_local_variable
    final currentIndex = ref.watch(bottomNavProvider);
    final isBottomVisible = ref.watch(bottomNavVisibilityProvider); 

    ref.listen<int>(bottomNavProvider, (previous, next) {
      if (_pageController.hasClients && _pageController.page?.round() != next) {
         _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease, 
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
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
                ProfileScreen(),
              ],
            )
          ),
          if (isBottomVisible) 
             Align(
                 alignment: Alignment.bottomCenter,
                 child: CustomBottomNavBar()),
        ],
      ),
    );
  }
}
