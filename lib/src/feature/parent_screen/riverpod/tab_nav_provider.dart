// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
<<<<<<< HEAD

// class TabNavigationState {
//   final int currentIndex;
//   final PageController controller;

//   TabNavigationState({required this.currentIndex, required this.controller});

=======
//
// class TabNavigationState {
//   final int currentIndex;
//   final PageController controller;
//
//   TabNavigationState({required this.currentIndex, required this.controller});
//
>>>>>>> e3a58765818e85f3f0bd44a2092ded4fbc550fed
//   TabNavigationState copyWith({int? currentIndex, PageController? controller}) {
//     return TabNavigationState(
//       currentIndex: currentIndex ?? this.currentIndex,
//       controller: controller ?? this.controller,
//     );
//   }
// }
<<<<<<< HEAD

=======
//
>>>>>>> e3a58765818e85f3f0bd44a2092ded4fbc550fed
// class TabNavigationNotifier extends StateNotifier<TabNavigationState> {
//   TabNavigationNotifier()
//       : super(TabNavigationState(
//           currentIndex: 0,
//           controller: PageController(initialPage: 0),
//         ));
<<<<<<< HEAD

=======
//
>>>>>>> e3a58765818e85f3f0bd44a2092ded4fbc550fed
//   void setTab(int index) {
//     state.controller.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//     );
//     state = state.copyWith(currentIndex: index);
//   }
<<<<<<< HEAD

=======
//
>>>>>>> e3a58765818e85f3f0bd44a2092ded4fbc550fed
//   void onPageChanged(int index) {
//     state = state.copyWith(currentIndex: index);
//   }
// }
<<<<<<< HEAD

=======
//
>>>>>>> e3a58765818e85f3f0bd44a2092ded4fbc550fed
// final tabNavigationProvider =
//     StateNotifierProvider<TabNavigationNotifier, TabNavigationState>(
//   (ref) => TabNavigationNotifier(),
// );
