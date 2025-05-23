import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/notification_screens/view/widgets/notification_tile_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/notification_model.dart';
import '../riverpod/notification_riverpod.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: AppPadding.screenHorizontal,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 115.h),

                  Text("Notification", style: textTheme.headlineSmall),
                  SizedBox(height: 10.h,),

                  Expanded(
                    child: Consumer(
                      builder: (_, ref, _) {
                        final notificationState = ref.watch(
                          notificationRiverpod,
                        );
                        final notificationList =
                            notificationState.notificationList;
                        return notificationList == null
                            ? Center(child: CircularProgressIndicator())
                            : notificationList.isEmpty
                            ? Text(
                              "No notifications yet",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: Color(0xff4A4C56)),
                            )
                            : ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              itemCount: notificationList.length,
                              itemBuilder: (_, index) {
                                final List<NotificationModel>
                                notificationSubList = notificationList[index];
                                return NotificationTileContainer(
                                  notificationList: notificationSubList,
                                );
                              },
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Utils.backButton(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
