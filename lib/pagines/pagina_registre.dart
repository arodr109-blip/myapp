import 'dart:ffi';

import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  const PaginaRegistre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          // Posar una imatge borrosa de fons.
          // =================================
          Stack(
            fit: StackFit.expand,
            children: [
              Image.asset("lib/imatges/grapes.png")
            ],
          ),
        ],
      ),
    );
  }
}