import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/src/feature/auth_screens/model/user_model.dart';
import 'package:car_wash/src/feature/auth_screens/view/signin_screens/Riverpod/login_provider.dart';
import 'package:car_wash/src/feature/home_screen/riverpod/home_state.dart';
import 'package:car_wash/src/model/service_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRiverpod = StateNotifierProvider<HomeRiverpod, HomeState>(
  (ref) {
    final userModel = ref.watch(loginProvider).userModel;
    return HomeRiverpod(userModel!);
    },
);

class HomeRiverpod extends StateNotifier<HomeState> {
  final UserModel userModel;
  HomeRiverpod(this.userModel) : super(HomeState()) {
    fetchServiceItem();
  }

  final List<Map<String, dynamic>> dummyServiceList = const [
    {"serviceName": "Car Wash", "iconPath": AppIcons.exteriorWash},
    {"serviceName": "Wheel Fixing", "iconPath": AppIcons.tireDressing},
    {"serviceName": "Store", "iconPath": AppIcons.store},
  ];

  void fetchServiceItem() {
    state = state.copyWith(
      serviceItem:
          dummyServiceList
              .map((item) => ServiceItemModel.fromJson(item))
              .toList(),
    );
  }

  void onServicesPageChange({required int index}) {
    state = state.copyWith(currentServiceItemPage: index);
  }
}
