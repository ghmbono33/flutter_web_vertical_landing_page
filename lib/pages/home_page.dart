import 'package:flutter/material.dart';
import 'package:vertical_landing_page/shared/custom_app_menu.dart';
import 'package:vertical_landing_page/views/about_view.dart';
import 'package:vertical_landing_page/views/contact_view.dart';
import 'package:vertical_landing_page/views/home_view.dart';
import 'package:vertical_landing_page/views/location_view.dart';
import 'package:vertical_landing_page/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: const [
          _HomeBody(),
          Positioned(right: 20, top: 20, child: CustomAppMenu())
        ],
      )),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
        PricingView()
      ],
    );
  }
}
