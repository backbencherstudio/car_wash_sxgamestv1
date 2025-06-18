import 'package:car_wash/core/constant/images.dart';
import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/all_blog_list_screen/view/widget/shimmer/blog_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../riverpod/client_review_list_provider.dart';

class ClientsReviewList extends StatelessWidget {
  const ClientsReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: AppPadding.screenHorizontal,
        //   child: Text(
        //     "Clients Sayings",
        //     style: Theme.of(context).textTheme.titleSmall,
        //   ),
        // ),
        SizedBox(
          height: 280.h,
          child: Consumer(
            builder: (_, ref, _) {
              final clientReviewListAsync = ref.watch(clientReviewListProvider);
              return clientReviewListAsync.when(
                data:
                    (reviews) =>
                        reviews.isEmpty
                            ? SizedBox.shrink()
                            : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: AppPadding.screenHorizontal,
                                  child: Text(
                                    "Clients Sayings",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: reviews.length,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 20.h,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {
                                      final review = reviews[index];
                                      return Container(
                                        width: 360.w,
                                        //height: 220.h,
                                        margin: EdgeInsets.only(right: 16.w),
                                        padding: EdgeInsets.all(16.r),
                                        decoration: Utils.commonBoxDecoration(),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          spacing: 8.h,
                                          children: [
                                            Row(
                                              spacing: 8.w,
                                              children: [
                                                ClipOval(
                                                  child: Image.asset(
                                                    AppImages.client,
                                                    width: 60.w,
                                                    height: 60.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  review.user.name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                Spacer(),
                                                Icon(Icons.star,color: Colors.orangeAccent,size: 25.sp,),
                                                Text(review.rating.toString(),style: Theme.of(context).textTheme.bodyMedium?.copyWith())
                                              ],
                                            ),
                                            Text(
                                              review.description,
                                              maxLines: 6,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium?.copyWith(
                                                color: AppColors.onSurface,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                error: (error, stack) => SizedBox.shrink(),
                loading: () => Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ],
    );
  }
}
