import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  // const CustomAppMenu({Key? key}) : super(key: key);
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

// el mixin con SingleTickerProviderStateMixin es necesario para anicializar el
// controller
class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String text) => text[0].toUpperCase() + text.substring(1);

    final paginas = context.read<PageProvider>().paginas;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse() : controller.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 800,
          color: Colors.black,
          // height: isOpen ? 310 : 50,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen)
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
              if (isOpen)
                ...List.generate(
                    paginas.length,
                    (index) => FadeInLeft(
                        from: 50,
                        delay: Duration(milliseconds: 75 * index),
                        duration: const Duration(milliseconds: 300),
                        child: CustomMenuItem(
                            text: capitalize(paginas[index]),
                            onPressed: () {
                              setState(() {
                                isOpen = false;
                              });
                              context.read<PageProvider>().goTo(index);
                            }))),
              DropdownButton<int>(
                items: List.generate(
                    4,
                    (index) => DropdownMenuItem<int>(
                          value: index,
                          child: Text("Opción $index"),
                        )),
                onChanged: (value) => print(value),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          // Container animado que cambia su ancho en función de si está abierto
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 50 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
