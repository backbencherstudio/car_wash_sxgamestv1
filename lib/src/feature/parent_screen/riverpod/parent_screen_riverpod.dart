import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_state.dart';
import 'package:car_wash/src/feature/services_screen/view/service_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../home_screen/view/home_screen.dart';
import '../../profile_screen/view/profile_screen.dart';
import '../dummy_screens/dummy2.dart';

final parentsScreenProvider =
    StateNotifierProvider<ParentsScreenProvider, ParentScreenState>((ref) {
      return ParentsScreenProvider();
    });

class ParentsScreenProvider extends StateNotifier<ParentScreenState> {
  ParentsScreenProvider() : super(ParentScreenState());

  final PageController pageController = PageController(initialPage: 0);

  /// List of Parent screen
  List<Widget> pageList = [
    HomeScreen(),
    ServiceListScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  /// Call this method from bottom nav bar button
  void onPageChange({required int index}) {
    int indexDifference = (state.selectedIndex - index).abs();
    debugPrint("\nSelected Page index : $index\n");
    state = state.copyWith(selectedIndex: index);

    /// If difference between pages is greater than 2 then jump to that page
    /// or normally animate to that page
   // tabController.animateTo(index);
    if (indexDifference > 2) {
      pageController.jumpToPage(index);
    } else {
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  /// call this method during drawer open or close event
  void onDrawerOpenOrClose(bool value) {
    state = state.copyWith(isDrawerOpened: value);
    debugPrint(
      "\nafter changing the endDrawerValue, value is : ${state.isDrawerOpened}\n",
    );
  }
}
