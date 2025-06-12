import 'package:car_wash/core/services/api_services/api_endpoints.dart';
import 'package:car_wash/src/feature/blog_details_screen/view/widgets/blog_details_header.dart';
import 'package:car_wash/src/feature/blog_details_screen/view/widgets/blog_html_body_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../blog_list_screen/model/blog_model.dart';
import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';

class BlogDetailsScreen extends StatelessWidget {
  final BlogModel blog;
  BlogDetailsScreen({super.key, required this.blog});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 145.h),
                  BlogDetailsHeader(
                    adminName: "sxgamestv1",
                    publishedDate: blog.createdAt!,
                    thumbnailImage: '${ApiEndPoints.baseUrl}/${blog.thumbnailUrl}',
                  ),
                  SizedBox(height: 10.h),

                  BlogHTMLBodyShow(
                    category: blog.category!,
                    title: blog.title!,
                    htmlText: blog.content!,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 20),
                  child: Utils.backButton(context: context),
                ),

                HomeHeader(isOnlyTrailing: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
