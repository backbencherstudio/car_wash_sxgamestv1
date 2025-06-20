import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/order_history/model/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final orderHistoryProvider = FutureProvider<List<OrderHistoryModel>>((ref) async {
  final userToken = ref.watch(loginProvider).userToken;
  debugPrint("\nuser token in home screen : $userToken\n");
  try {
    final headers = {
      'Authorization':
      'bearer $userToken',
    };

    final data = await ApiServices.instance.getData(
      endPoint: ApiEndPoints.orderHistory,
      headers: headers,
    );

    debugPrint("\nSuccessfully fetched order history list\n");

    final List<OrderHistoryModel> orderHistoryList = (data['data'] as List)
        .map((item) => OrderHistoryModel.fromJson(item))
        .toList();

    return orderHistoryList;
  } catch (e) {
    throw Exception('Error while fetching order history list list: $e');
  }
});
