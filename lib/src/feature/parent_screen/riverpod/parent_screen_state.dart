import 'package:flutter/material.dart';
import '../../home_screen/view/home_screen.dart';
import '../../profile_Create_screen/view/profile_screen.dart';
import '../dummy_screens/dummy1.dart';
import '../dummy_screens/dummy2.dart';

class ParentScreenState{
  final List<Widget> pageList;
  final int selectedIndex;
  ParentScreenState({
    this.pageList = const [HomeScreen(),Love(), FavouriteScreen(), ProfileCreateScreen()],
    this.selectedIndex = 0,
  });
  ParentScreenState copyWith({List<Widget>? pageList, int? selectedIndex}){
    return ParentScreenState(pageList: pageList ?? this.pageList, selectedIndex: selectedIndex ?? this.selectedIndex);
  }

}