import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/parent_screen_riverpod.dart';

class ParentScreen extends StatelessWidget{
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:  Padding(
    padding: const EdgeInsets.all(16.0),
    child: CustomBottomNavBar(),
  ),
      body: Consumer(
          builder: (_, ref, _){
            final parentScreenState = ref.watch(parentsScreenProvider);
            return Stack(
              children: [
                Positioned.fill(
                  child: IndexedStack(
                    index: parentScreenState.selectedIndex,
                    children: parentScreenState.pageList,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}