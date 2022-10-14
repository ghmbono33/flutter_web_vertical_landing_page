import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, parameters) {
  return const HomePage();
});
