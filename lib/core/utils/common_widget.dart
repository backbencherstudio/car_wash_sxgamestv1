import 'dart:io';
import 'package:car_wash/core/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final bool isNetworkImage;

  const FullScreenImage({
    super.key,
    required this.imageUrl,
    required this.isNetworkImage,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the image is a file and if it exists
    final isFileImage = !isNetworkImage && File(imageUrl).existsSync();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: EdgeInsets.all(16.r),
            child: SvgPicture.asset("assets/icons/backbutton.svg"),
            height: 28.h,
            width: 28.w,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Hero(
              tag: "fullScreenImage", 
              child: PhotoView(
                imageProvider: isNetworkImage
                    ? NetworkImage(imageUrl) 
                    : isFileImage
                        ? FileImage(File(imageUrl)) 
                        : AssetImage(AppImages.shakin) as ImageProvider, 
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
