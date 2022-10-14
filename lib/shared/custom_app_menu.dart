import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          isOpen ? controller.reverse : controller.forward;
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
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
                icon:
                    isOpen ? AnimatedIcons.menu_close : AnimatedIcons.add_event,
                progress: controller,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
