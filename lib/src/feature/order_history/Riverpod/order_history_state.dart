import 'package:car_wash/src/feature/order_history/model/order_history_model.dart';

class OrderHistoryState {
  final bool? isLoading;
  final OrderHistoryModel? OrderHistory;

  OrderHistoryState({
    this.isLoading = false,
    this.OrderHistory,
  });
  OrderHistoryState copyWith({
    bool? isLoading,
    OrderHistoryModel? OrderHistory,
  }) {
    return OrderHistoryState(
      isLoading: isLoading ?? this.isLoading,
      OrderHistory: OrderHistory ?? this.OrderHistory,
    );
  }
}
