
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentPageProvider = StateProvider<int>((ref)=>0);
final totalStepsProvider = Provider<int>((ref)=>7);
final taskStatusProvider = StateProvider<List<bool>>((ref)=>[false, false, false, false,false,false,false]);