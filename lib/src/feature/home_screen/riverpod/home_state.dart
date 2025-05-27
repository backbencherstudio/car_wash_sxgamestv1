import 'package:car_wash/src/model/service_list_model.dart';

class HomeState {
  List<ServiceItemModel>? serviceItem;
  int currentServiceItemPage;
  HomeState({this.serviceItem, this.currentServiceItemPage = 0});

  HomeState copyWith({
    List<ServiceItemModel>? serviceItem,
    int? currentServiceItemPage,
  }) {
    return HomeState(
      serviceItem: serviceItem ?? this.serviceItem,
      currentServiceItemPage:
          currentServiceItemPage ?? this.currentServiceItemPage,
    );
  }
}
