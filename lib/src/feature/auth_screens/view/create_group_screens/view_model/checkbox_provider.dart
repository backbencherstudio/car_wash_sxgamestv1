import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkboxListProvider = StateProvider<List<bool>>((ref) => [false, false]);
