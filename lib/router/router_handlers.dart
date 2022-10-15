import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/pages/home_page.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

final homeHandler = Handler(handlerFunc: (context, parameters) {
  final page = parameters["page"]![0];

  // cuando vamos a la url /home entra por aquí con / y con home.
  // No tenemos en cuenta /
  if (page == "/") return null;
  // creamos una instancia page controller que apuntará a la página que viene por url
  // y saltará automáticamente a esa página
  context!.read<PageProvider>().createPageController(page);
  return const HomePage();

  // createScrollController
});
