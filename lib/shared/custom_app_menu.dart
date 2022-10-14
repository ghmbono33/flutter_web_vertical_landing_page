import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final paginas = ["home", "about", "contact", "location", "pricing"];
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse() : controller.forward();
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          color: Colors.black,
          height: isOpen ? 300 : 50,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen)
                const Divider(
                  color: Colors.white,
                  thickness: 4,
                ),
              if (isOpen)
                ...List.generate(
                    paginas.length,
                    (index) =>
                        CustomMenuItem(text: paginas[index], onPressed: () {}))
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
