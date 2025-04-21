import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final parentsScreenProvider = StateNotifierProvider<ParentsScreenProvider, ParentScreenState>(
        (ref) {
      return ParentsScreenProvider();
    });


class ParentsScreenProvider extends StateNotifier<ParentScreenState>{

  ParentsScreenProvider() : super(ParentScreenState());


  void onSelectedIndex({required int index}) {
    debugPrint("\nSelected Page index : $index\n");
    state = state.copyWith(selectedIndex: index);
  }
}

