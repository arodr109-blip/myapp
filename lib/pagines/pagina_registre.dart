import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/components/titol_app.dart';

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
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: const Color.fromARGB(60, 232, 123, 79),
            ),
          ),

          // Elements de la pàgina.
          // ======================
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 120,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [TitolApp(text1: "S", text2: "avorSphere", midaGran: true,)],
                ),
              ],
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