import 'dart:isolate';

import 'package:car_wash/src/feature/blog_details_screen/riverpod/blog_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/api_services/api_services.dart';

void onBlogViewInIsolate(Map<String, dynamic> args) async {
  SendPort sendPort = args['sendPort'];
  try {
    final headers = {};
    final response = await ApiServices.instance.postData(
      endPoint: '',
      body: {},
      headers: {},
    );
    sendPort.send(response);
  } catch (e) {
    throw Exception('Error on viewing blog: $e');
  }
}

final blogProvider = StateNotifierProvider<BlogProvider, BlogState>(
  (ref) => BlogProvider(),
);

class BlogProvider extends StateNotifier<BlogState> {
  BlogProvider() : super(BlogState());

  Future<void> onBlogView() async {
    try {
      ReceivePort receivePort = ReceivePort();
      await Isolate.spawn(onBlogViewInIsolate, {
        "sendPort": receivePort.sendPort,
      });
      receivePort.listen((response) {
        debugPrint("\nOn View, Response : $response\n");
      });
    } catch (error) {
      throw Exception('\nException while view blog: $error\n');
    }
  }
}
