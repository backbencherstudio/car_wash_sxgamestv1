import 'package:car_wash/core/routes/route_name.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:car_wash/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_color_pallete.dart';
import 'package:car_wash/src/feature/auth_screens/view/auth_style/auth_input_decoration_theme.dart';
import 'package:car_wash/src/feature/auth_screens/view/create_group_screens/view/widgets/group_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  String selectedGroup = 'Friends';
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    /// Text theme
    // final bodyLarge = Theme.of(context).textTheme.bodyLarge;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;
    final titleSmall = Theme.of(context).textTheme.titleSmall;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      // appBar: Utils.appBarBackButton(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/create-group-bg.png",fit: BoxFit.cover,),
          Column(
            children: [
              Utils.appBarBackButton(context),
              SizedBox(height: 70.h),
              Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.68,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: AuthColorPalette.cardBackground,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create a group for',
                    style: headlineSmall,
                  ),
                  SizedBox(height: 44.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What group do you want to create?',
                      style: bodyLarge?.copyWith(
                          color: AuthColorPalette.titleColor,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  groupOptionTile(label: 'Friends',
                      iconImage: "assets/icons/friends.png",
                      context: context),
                  SizedBox(height: 12.h),
                  groupOptionTile(label: 'Family',
                      iconImage: "assets/icons/family.png",
                      context: context),
                  SizedBox(height: 32.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Type your group name',
                      style: bodyLarge?.copyWith(
                          color: AuthColorPalette.titleColor,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    decoration: AuthInputDecorationTheme
                        .lightInputDecorationTheme(
                      context: context,
                      hintText: "Input area",
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CommonWidgets.primaryButton(context: context,
                      title: "Done",
                      color: AuthColorPalette.primary,
                      textColor: AuthColorPalette.white,
                      onPressed: () {
                    // context.pushNamed(RouteName.congratulationScreen);
                      }),
                ],
              ),
            )],
          )
        ],
      ),
    );
  }


}
