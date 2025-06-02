import 'package:car_wash/core/constant/padding.dart';
import 'package:car_wash/core/theme/theme_extension/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogHTMLBodyShow extends StatelessWidget {
  final String category;
  final String  title;
  final String htmlText;
  const BlogHTMLBodyShow({super.key,
  required this.category,
    required this.title,
    required this.htmlText
  });

//   final String htmlData = '''
// <div style="font-family: Arial, sans-serif; line-height: 1.6; color: #333; padding: 16px;">
//   <h2 style="font-size: 24px;">Why Regular Car Washing is More Important Than You Think</h2>
//   <p>
//     Keeping your car clean is not just about looking good—it’s about protecting your investment.
//   </p>
//   <p>
//     Over time, dust, mud, bird droppings, road salt, and pollution can eat away at your car’s paint and underbody. Regular washes help remove these harmful elements before they cause lasting damage. Especially in urban areas, washing your car weekly or bi-weekly can prevent rust, maintain the paint, and increase resale value.
//   </p>
//
//   <h3 style="font-size: 20px; margin-top: 24px;">How We Make It Easier</h3>
//   <p>
//     With our \$7/month subscription, we bring professional-grade car wash services to your fingertips. Whether you choose instant wash or schedule ahead, our team ensures your car stays clean without hassle.
//   </p>
//
//   <h3 style="font-size: 20px; margin-top: 24px;">Book Your Next Wash Now!</h3>
//   <p>
//     Ready for a spotless shine? Use our app to auto-detect your location, select your service, and let us handle the rest. Clean car, clear mind!
//   </p>
//
//   <div style="margin: 24px 0;">
//     <img src="https://i.imgur.com/rMssbQ9.jpeg" />
//   </div>
//
//   <h3 style="font-size: 20px; margin-top: 24px;">Benefits of Regular Car Washing</h3>
//   <ul style="padding-left: 20px;">
//     <li><strong>Prevents Paint Damage:</strong> Dirt and grime trap moisture and contaminants, which can lead to paint corrosion.</li>
//     <li><strong>Improves Safety:</strong> Clean windows, mirrors, and lights improve visibility and driving safety.</li>
//     <li><strong>Enhances Vehicle Value:</strong> Dirt and grime trap moisture and contaminants, which can lead to paint corrosion.</li>
//     <li><strong>Protects Underbody:</strong> Dirt and grime trap moisture and contaminants, which can lead to paint corrosion.</li>
//   </ul>
// </div>
// ''';

  @override
  Widget build(BuildContext context) {
    final bodyTextColor = Color(0xff62676C);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppPadding.screenHorizontal,
          child: Text(
            category,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
          ),
        ),

        SizedBox(height: 8.h,),
        Padding(
            padding: AppPadding.screenHorizontal,
            child: Text(title, style: Theme.of(context).textTheme.headlineSmall,)),
        SizedBox(height: 8.h,),
        Html(
          data: htmlText,
          shrinkWrap: true,
          style: {
            "h2": Style(
              color: AppColors.textColor,
              fontSize: FontSize.xxLarge,
              fontWeight: FontWeight.w600,
              lineHeight: LineHeight.normal,
            ),
            "h3": Style(
              color: AppColors.textColor,
              fontSize: FontSize.xLarge,
              fontWeight: FontWeight.w600,
            ),
            "p": Style(
              color: bodyTextColor,
              fontSize: FontSize.medium,
              fontWeight: FontWeight.w400,
              lineHeight: LineHeight.number(1.3),
            ),
          },
        ),
      ],
    );
  }
}
