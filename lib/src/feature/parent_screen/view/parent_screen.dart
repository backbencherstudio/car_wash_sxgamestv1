import 'package:car_wash/src/feature/parent_screen/view/widget/customNavBar.dart';
import 'package:car_wash/src/feature/parent_screen/view/widget/homeWarpper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/parent_screen_riverpod.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeWrapper());
  }
}
