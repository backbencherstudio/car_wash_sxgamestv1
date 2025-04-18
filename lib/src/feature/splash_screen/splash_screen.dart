import 'package:car_wash/core/constant/icons.dart';
import 'package:car_wash/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Utils.customAppBar(
                leadingImageAddress:
                    'https://imgcdn.stablediffusionweb.com/2024/3/23/dc1a287c-0eb2-4a27-9a22-075711a0fbcf.jpg',
                title: 'Muntasir',
                subtitle: 'Dhaka Bangladesh',
                subtitlePreIconAsset:AppIcons.locationIcon, context: context,
                trailing: [
                  GestureDetector(
                    child: Icon(Icons.location_history)
                  ),GestureDetector(
                    child: Icon(Icons.location_pin)
                  ),
                ]
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'ehfga',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
