import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/router/router.dart';
import 'package:vertical_landing_page/scroll_pageview.dart';

void main() {
  FRouter.configureRoutes();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PageProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
