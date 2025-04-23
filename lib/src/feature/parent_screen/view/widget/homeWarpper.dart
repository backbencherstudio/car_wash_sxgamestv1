import 'package:car_wash/src/feature/home_screen/view/home_screen.dart';
import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    ref.listen<int>(bottomNavProvider, (prev, next) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) => ref.read(bottomNavProvider.notifier).state = index,
              children: const [
                Center(child: HomeScreen()),
                Center(child: Text("Favorites Screen")),
                Center(child: Text("Services Screen")),
                Center(child: Text("Profile Screen")),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: CustomBottomNavBar(),
          ),
        ],
      ),
    );
  }
}
