import 'dart:math';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  final paginas = ["home", "about", "contact", "location", "pricing"];

  PageController pageController = PageController();

  void createPageController(String routeName) {
    // Necesitamos este método porque cuando indicamos la url manualmente en
    // el navegador el pageController todavía no está creado por lo que no podemos
    // decirle que vaya a una página concreta (con animateToPage). Por eso creamos
    // la instancia en la que sí podemos pasarle la página inicial

    // Buscamos la posición de la página que coincida con la ruta.
    //Si no la encuentra la posición sera -1 por eso gasto el max que ponga 0
    final int initialPage = max(paginas.indexOf(routeName.toLowerCase()), 0);
    int tmpPage = -1;

    pageController = PageController(initialPage: initialPage);
    pageController.addListener(() {
      // escuchamos el pagecontroller para modificar la url
      final int page = pageController.page!.round();
      if (tmpPage != page) {
        final String currentPage = paginas[page];
        // Cambiamos el título de la página
        html.document.title = currentPage;
        // Cambiamos la url
        html.window.history.pushState(null, "", "#/$currentPage");
        tmpPage = page;
      }
    });
  }

  void goTo(int index) {
    // para que en el navegador cambie la url a la página seleccionada
    html.window.history.pushState(null, "", "#/${paginas[index]}");
    pageController.animateToPage(index,
        duration: const Duration(microseconds: 250), curve: Curves.easeInOut);
  }
}
