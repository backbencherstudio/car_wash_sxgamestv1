import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/src/feature/blog_list_screen/view/widget/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../home_screen/view/widgets/home_header/home_header.dart';

class BlogListScreen extends StatelessWidget{
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [


          Positioned.fill(

              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 145.h),
                    Padding(
                        padding: AppPadding.screenHorizontal,
                        child: Text("Our Blog",style: textTheme.headlineSmall,)),
                    SizedBox(height: 22.h,),
                    ListView.builder(
                      itemCount: 10,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 0,bottom: 30.h),
                        itemBuilder: (_, index){
                        return Center(child: BlogCard());
                        }
                    )
                  ],
                ),
              )
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