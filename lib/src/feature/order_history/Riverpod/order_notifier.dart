import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/core/services/api_services/api_services.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/order_history/model/order_history_model.dart';
import 'package:car_wash/src/feature/order_history/Riverpod/order_history_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final orderHistoryProvider =
//     StateNotifierProvider<OrderStateNotifier, OrderHistoryState>((ref) {
//        final String? userToken = ref.watch(loginProvider).userToken;
//       return OrderStateNotifier(userToken: userToken!);
//     });

// class OrderStateNotifier extends StateNotifier<OrderHistoryState> {
//   final String userToken;

//   OrderStateNotifier({required this.userToken}) : super(OrderHistoryState());

//   Future<void> showOrderHistory() async {
//     try {
//       state = state.copyWith(isLoading: true);
//       final token = userToken;

//       final response = await ApiServices.instance.getData(
//         endPoint: ApiEndPoints.orderHistory,
//         headers: {
//           'Authorization': userToken,
//         },
//       );
//       state = state.copyWith(isLoading: false, OrderHistory: response["data"]);
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }



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
