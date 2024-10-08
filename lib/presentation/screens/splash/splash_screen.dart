import 'package:flutter/material.dart';
import 'package:islamic_app/core/assets_manager.dart';
import 'package:islamic_app/core/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, RouteManager.homeRoute);
      },
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AssetsManager.splashBgLight,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(AssetsManager.splashLogo),
          const Spacer(),
          Image.asset(AssetsManager.splashSignature),
        ],
      ),
    );
  }
}
