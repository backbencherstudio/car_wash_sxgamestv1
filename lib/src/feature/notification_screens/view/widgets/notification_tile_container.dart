import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constant/padding.dart';
import '../../model/notification_model.dart';

class NotificationTileContainer extends StatelessWidget {
  final List<NotificationModel> notificationList;

  const NotificationTileContainer({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final DateTime notificationDate = notificationList[0].dateTime;
    late final String dateHeading;
    final DateTime today = DateTime.now();
    if (notificationDate.day == today.day &&
        notificationDate.month == today.month &&
        notificationDate.year == today.year) {
      dateHeading = "Today";
    }
    else if(notificationDate.day == today.day - 1 && notificationDate.month == today.month && notificationDate.year == today.year){
      dateHeading = "Yesterday";
    }

    else {
      dateHeading = DateFormat('MMM dd, yyyy').format(notificationDate);
    }

    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Date Heading
        Text(dateHeading, style: Theme.of(context).textTheme.titleSmall),

        /// List of same date notification
        Container(
          width: 358.w,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: notificationList.length,
            itemBuilder: (_, index) {
              final notification = notificationList[index];
              return Column(
                spacing: 12.h,
                children: [
                  if (index != 0)
                    Column(children: [SizedBox(height: 12.h), Divider(color: Color(0xffEEF3F8),)]),

                  Row(
                    spacing: 12.w,
                    children: [
                      SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: ClipOval(
                          child: Image.asset(
                            notification.profilePicture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6.h,
                          children: [
                            Text("Carl Steadham",style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                            SelectableText(
                              notification.title,
                              maxLines: 1,
                              style: textTheme.bodyMedium?.copyWith(
                                color: Color(0xff4A4C56)
                              ),
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),

        SizedBox(height: 18.h),
      ],
    );
  }
}
