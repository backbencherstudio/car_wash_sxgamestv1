// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TabNavigationState {
//   final int currentIndex;
//   final PageController controller;

//   TabNavigationState({required this.currentIndex, required this.controller});

//   TabNavigationState copyWith({int? currentIndex, PageController? controller}) {
//     return TabNavigationState(
//       currentIndex: currentIndex ?? this.currentIndex,
//       controller: controller ?? this.controller,
//     );
//   }
// }

// class TabNavigationNotifier extends StateNotifier<TabNavigationState> {
//   TabNavigationNotifier()
//       : super(TabNavigationState(
//           currentIndex: 0,
//           controller: PageController(initialPage: 0),
//         ));
