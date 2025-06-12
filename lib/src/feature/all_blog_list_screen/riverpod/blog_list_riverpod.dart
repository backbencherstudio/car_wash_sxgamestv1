// import 'dart:isolate';
//
// import 'package:car_wash/core/services/api_services/api_endpoints.dart';
// import 'package:car_wash/core/services/api_services/api_services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/blog_model.dart';
// import 'blog_list_state.dart';
//
// final blogListProvider =
//     StateNotifierProvider<BlogListRiverpod, AllBlogListState>((ref) {
//       return BlogListRiverpod();
//     });
//
// class BlogListRiverpod extends StateNotifier<AllBlogListState> {
//   BlogListRiverpod() : super(AllBlogListState());
//
//   Future<void> getBlogList() async {
//     try {
//       final headers = {
//         'Authorization':
//             'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZvcnBheW1lbnRAZ21haWwuY29tIiwic3ViIjoiY21iZDV5NXJpMDAwNGpoc2xxYnRjeXJ5NiIsImlhdCI6MTc0ODc1NTIzOCwiZXhwIjoxNzQ4ODQxNjM4fQ.CkS_QFKI9AcZGWSWZTxsmpltzm6NeuaYCs7QjnhVDAE',
//       };
//       final data = await ApiServices.instance.getData(
//         endPoint: ApiEndPoints.blogList,
//         headers: headers,
//       );
//       debugPrint("\nSuccessfully fetched blog list\n");
//       final List<BlogModel>? blogList = data['data'].map((item) => BlogModel.fromJson(item)).toList().cast<BlogModel>();
//       state = state.copyWith(
//         blogList: blogList,
//       );
//     } catch (e) {
//       throw Exception('Error while getting blog list : $e');
//     }
//   }
// }


import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/blog_model.dart';

final blogListProvider = FutureProvider<List<BlogModel>>((ref) async {
  try {
    final headers = {
      'Authorization':
      'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZvcnBheW1lbnRAZ21haWwuY29tIiwic3ViIjoiY21iZDV5NXJpMDAwNGpoc2xxYnRjeXJ5NiIsImlhdCI6MTc0ODc1NTIzOCwiZXhwIjoxNzQ4ODQxNjM4fQ.CkS_QFKI9AcZGWSWZTxsmpltzm6NeuaYCs7QjnhVDAE',
    };

    final data = await ApiServices.instance.getData(
      endPoint: ApiEndPoints.blogList,
      headers: headers,
    );

    debugPrint("\nSuccessfully fetched blog list\n");

    final List<BlogModel> blogList = (data['data'] as List)
        .map((item) => BlogModel.fromJson(item))
        .toList();

    return blogList;
  } catch (e) {
    throw Exception('Error while getting blog list: $e');
  }
});
