import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pagines/pagina_registre.dart';

void main() {
  runApp(const SavorSphere());
}

class SavorSphere extends StatelessWidget {
  const SavorSphere({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SavorSphere',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const PaginaRegistre(),
    );
  }
}
