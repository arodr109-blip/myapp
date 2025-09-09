import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  const PaginaRegistre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          // Posar imatges de fons.
          // ======================
          FonsPantalla(),

          // Fer la imatge de fons borrosa i amb un color general.
          // =====================================================
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: const Color.fromARGB(80, 232, 123, 79),
            ),
          ),
        ],
      ),
    );
  }
}

Widget FonsPantalla() {

  return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            "lib/imatges/grapes.png", 
                            fit: BoxFit.contain,
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          "lib/imatges/orange.png", 
                          fit: BoxFit.contain,
                          width: 100,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          "lib/imatges/strawberry.png", 
                          fit: BoxFit.contain,
                          width: 100,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 80, right: 40),
                        child: Image.asset(
                          "lib/imatges/pastel.png", 
                          fit: BoxFit.contain,
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
            ],
          );
}