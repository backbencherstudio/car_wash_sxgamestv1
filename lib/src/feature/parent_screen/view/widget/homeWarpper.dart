import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_riverpod.dart';
import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWrapper extends ConsumerStatefulWidget {
  const HomeWrapper({super.key});
  @override
  ConsumerState<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends ConsumerState<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    final parentScreenState = ref.watch(parentsScreenProvider);
    final parentScreenNotifier = ref.read(parentsScreenProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: parentScreenNotifier.pageController,
              physics: const NeverScrollableScrollPhysics(),

              children: parentScreenNotifier.pageList,
            ),
          ),
          if (!parentScreenState.isDrawerOpened)
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavBar(),
            ),
        ],
      ),
    );
  }
}
