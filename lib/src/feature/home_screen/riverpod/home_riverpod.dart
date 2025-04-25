import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/src/feature/home_screen/riverpod/home_state.dart';
import 'package:car_wash/src/model/service_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeRiverpod = StateNotifierProvider<HomeRiverpod, HomeState>((ref)=>HomeRiverpod(),);

class HomeRiverpod extends StateNotifier<HomeState>{
  HomeRiverpod() : super(HomeState()){
    fetchServiceItem();
  }

  final List<Map<String, dynamic>> dummyServiceList = const [
    {
      "serviceName": "Exterior Wash",
      "iconPath": AppIcons.exteriorWash
    },
    {
      "serviceName": "Tire Dressing",
      "iconPath": AppIcons.tireDressing
    },
    {
      "serviceName": "Hand Drying",
      "iconPath": AppIcons.handDrying
    },
    {
      "serviceName": "Interior Wash",
      "iconPath": AppIcons.interiorWash
    },
    {
      "serviceName": "Tire Cleaning",
      "iconPath": AppIcons.tireCleaning
    },
    {
      "serviceName": "Engine Wash",
      "iconPath": AppIcons.engineWash
    },
    {
      "serviceName": "Exterior Wash",
      "iconPath": AppIcons.exteriorWash
    },
    {
      "serviceName": "Tire Dressing",
      "iconPath": AppIcons.tireDressing
    },
    {
      "serviceName": "Hand Drying",
      "iconPath": AppIcons.handDrying
    },
    {
      "serviceName": "Interior Wash",
      "iconPath": AppIcons.interiorWash
    },
    {
      "serviceName": "Tire Cleaning",
      "iconPath": AppIcons.tireCleaning
    },
    {
      "serviceName": "Engine Wash",
      "iconPath": AppIcons.engineWash
    }
  ];

  void fetchServiceItem(){
    state = state.copyWith(
      serviceItem: dummyServiceList.map((item)=>ServiceItemModel.fromJson(item)).toList()
    );
  }

  void onServicesPageChange({required int index}){
    state = state.copyWith(
      currentServiceItemPage: index
    );
  }

}