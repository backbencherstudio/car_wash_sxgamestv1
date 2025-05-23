class NotificationModel {
  final String title;
  final String profilePicture;
  final DateTime dateTime;

  NotificationModel({
    required this.title,
    required this.profilePicture,
    required this.dateTime,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json,) {
    return NotificationModel(
      title: json['title'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      dateTime: DateTime.tryParse(json['dateTime'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'profilePicture': profilePicture,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'NotificationModel(title: $title, profilePicture: $profilePicture, dateTime: $dateTime)';
  }
}