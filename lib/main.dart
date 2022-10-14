import 'package:flutter/material.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/scroll_pageview.dart';

void main() {
  FRouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: 'Landing Page App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      onGenerateRoute: FRouter.router.generator,
    );
  }
}
