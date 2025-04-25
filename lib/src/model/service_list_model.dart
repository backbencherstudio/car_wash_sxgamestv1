class ServiceItemModel {
  final String serviceName;
  final String iconPath;

  ServiceItemModel({
    required this.serviceName,
    required this.iconPath,
  });

  factory ServiceItemModel.fromJson(Map<String, dynamic> json) {
    return ServiceItemModel(
      serviceName: json['serviceName'],
      iconPath: json['iconPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'iconPath': iconPath,
    };
  }
}