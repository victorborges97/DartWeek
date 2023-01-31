import 'package:delivery_app/app/core/provider/application_binding.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/pages/home/home_router.dart';
import 'package:delivery_app/app/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AplicationBinding(
      child: MaterialApp(
        title: "Delivery App",
        debugShowCheckedModeBanner: false,
        theme: context.themeConfig.themeData,
        routes: {
          "/": (context) => SplashPage(),
          "/home": (context) => HomeRouter.page,
        },
      ),
    );
  }
}
