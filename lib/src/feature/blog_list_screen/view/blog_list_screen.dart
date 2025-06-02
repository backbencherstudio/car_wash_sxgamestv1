import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/blog_list_screen/view/widget/blog_card.dart';
import 'package:car_wash/src/feature/blog_list_screen/view/widget/shimmer/blog_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../home_screen/view/widgets/drawer/home_drawer.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/blog_list_riverpod.dart';

class BlogListScreen extends StatelessWidget {
  BlogListScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: appDrawer(context: context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child:
            Consumer(
                builder: (_, ref, _) {
                return RefreshIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.white,

                  onRefresh: () async {
                    ref.refresh(blogListProvider);
                    await ref.read(blogListProvider.future);
                  },
                  child: ListView(
                    padding: EdgeInsets.zero,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 145.h),
                      Padding(
                        padding: AppPadding.screenHorizontal,
                        child: Text("Our Blogs", style: textTheme.headlineSmall),
                      ),
                      SizedBox(height: 22.h),
                      Consumer(
                        builder: (_, ref, _) {
                          final blogListAsync = ref.watch(blogListProvider);
                          return blogListAsync.when(
                              data: (blogs)=> blogs.isEmpty ?
                              Center(child: Text("Empty",style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),)
                              :
                              ListView.builder(
                                itemCount: blogs.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 0, bottom: 30.h),
                                itemBuilder: (_, index) {
                                  final blog = blogs[index];
                                  return Center(child: BlogCard(blog: blog,));
                                },
                              ),
                              error: (error, stack) => Center(child: Text('Error: $error')),
                              loading: ()=> BlogShimmer()
                          );


                        }
                      ),
                      SizedBox(height: 22.h),
                    ],
                  ),
                );
              }
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
