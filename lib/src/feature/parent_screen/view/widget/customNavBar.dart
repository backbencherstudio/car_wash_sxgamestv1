import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/feature/parent_screen/riverpod/parent_screen_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomBottomNavBar extends ConsumerStatefulWidget{
  const CustomBottomNavBar({super.key});

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> with TickerProviderStateMixin  {


  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context,) {
    final parentScreenNotifier = ref.read(parentsScreenProvider.notifier);
    final parentScreenState = ref.watch(parentsScreenProvider);

    final items = [
      {'icon': 'assets/icons/home.svg', 'label': 'Home'},
      {'icon': 'assets/icons/heart.svg', 'label': 'Favorites'},
      {'icon': 'assets/icons/heartbroken.svg', 'label': 'Services'},
      {'icon': 'assets/icons/pp.svg', 'label': 'Profile'},
    ];
    /// Get the width of each button (divide the screen width by the number of items)
    final itemWidth = MediaQuery.of(context).size.width / items.length;

    /// Create a GlobalKey to reference the first button's size
    /// List of GlobalKeys to get the width of each button
    final List<GlobalKey> buttonKeys = List.generate(items.length, (_) => GlobalKey());

    return SafeArea(
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        margin: AppPadding.screenHorizontal,
        decoration: Utils.commonBoxDecoration(),
        child:
        // TabBar(
        //   controller: tabController,
        //     indicator: BoxDecoration(
        //       color: AppColors.primary,
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        //     // indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
        //
        //     indicatorSize: TabBarIndicatorSize.tab,
        //
        //     dividerColor: Colors.transparent,
        //     tabs: [
        //       _buildTabItem(
        //           context: context,
        //           onPressed: (){
        //             tabController.animateTo(0);
        //             parentScreenNotifier.onPageChange(index: 0);
        //             },
        //           iconPath: items[0]['icon']!,
        //           text: items[0]['label']!,
        //           isActive: parentScreenState.selectedIndex == 0
        //       ),
        //       _buildTabItem(
        //           context: context,
        //           onPressed: (){
        //             parentScreenNotifier.onPageChange(index: 1);
        //             tabController.animateTo(1);
        //             },
        //           iconPath: items[1]['icon']!,
        //           text: items[1]['label']!,
        //           isActive: parentScreenState.selectedIndex == 1
        //       ),
        //       _buildTabItem(
        //           context: context,
        //           onPressed: (){
        //             parentScreenNotifier.onPageChange(index: 2);
        //             tabController.animateTo(2);
        //             },
        //           iconPath: items[2]['icon']!,
        //           text: items[2]['label']!,
        //           isActive: parentScreenState.selectedIndex == 2
        //       ),
        //       _buildTabItem(
        //           context: context,
        //           onPressed: (){
        //             parentScreenNotifier.onPageChange(index: 3);
        //             tabController.animateTo(3);
        //             },
        //           iconPath: items[3]['icon']!,
        //           text: items[3]['label']!,
        //           isActive: parentScreenState.selectedIndex == 3
        //       ),
        //     ]
        // )

        Stack(
          children: [

            /// Sliding background
            // AnimatedPositioned(
            //   duration: Duration(milliseconds: 200),
            //   curve: Curves.easeInOut,
            //   left: parentScreenState.selectedIndex*94.w,
            //   bottom: 0,
            //   child: Container(
            //     width: 110.w, // Use dynamic width
            //     height: 48.h, // Indicator height
            //     decoration: BoxDecoration(
            //       color: AppColors.primary, // You can set the color here
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  List.generate(items.length, (index) {
                final isActive = index == parentScreenState.selectedIndex;

                return
                  ElevatedButton(
                  key: buttonKeys[index], /// Only assign key to the first button
                  onPressed:
                      () {
                    parentScreenNotifier.onPageChange(index: index);},
                  style: ElevatedButton.styleFrom(
                    enableFeedback: false,
                    overlayColor:
                        Colors.transparent, // this one for fade effect
                    shadowColor:
                        Colors
                            .transparent, // this one is also for the fade effect
                    surfaceTintColor: Colors.transparent,

                    backgroundColor:
                        isActive ? AppColors.primary : Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: isActive ? 10 : 0,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    spacing: 8.w,
                    children: [
                      SvgPicture.asset(
                        items[index]['icon']!,
                        colorFilter: ColorFilter.mode(
                          isActive ? Colors.white : Colors.black54,
                          BlendMode.srcIn,
                        ),
                        height: 24.h,
                        width: 24.w,
                      ),
                      if (isActive)
                        Text(
                          items[index]['label']!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),

                        ),
                    ],
                  ),
                );
              }),
            ),

          ],
        ),
      ),
    );
  }


  // Widget _buildTabItem({
  //   required BuildContext context,
  //   required Function onPressed,
  //   required String iconPath,
  //   required String text,
  //   required bool isActive
  // })
  // {
  //   return   ElevatedButton(
  //     onPressed:
  //         () {
  //       onPressed();},
  //     style: ElevatedButton.styleFrom(
  //       enableFeedback: false,
  //       overlayColor:
  //       Colors.transparent, // this one for fade effect
  //       shadowColor:
  //       Colors
  //           .transparent, // this one is also for the fade effect
  //       surfaceTintColor: Colors.transparent,
  //
  //       backgroundColor:  Colors.transparent,
  //       //isActive ? AppColors.primary : Colors.transparent,
  //       elevation: 0,
  //       padding: EdgeInsets.symmetric(
  //         horizontal: isActive ? 10 : 0,
  //         vertical: 10,
  //       ),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //     ),
  //     child: Row(
  //       spacing: 8.w,
  //       children: [
  //         SvgPicture.asset(
  //           iconPath,
  //           colorFilter: ColorFilter.mode(
  //             isActive ? Colors.white : Colors.black54,
  //             BlendMode.srcIn,
  //           ),
  //           height: 24.h,
  //           width: 24.w,
  //         ),
  //         if (isActive)
  //           Text(
  //             text,
  //             style: Theme.of(
  //               context,
  //             ).textTheme.bodyLarge!.copyWith(
  //               color: Colors.white,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           maxLines: 1,
  //           ),
  //       ],
  //     ),
  //   );
  // }

}


