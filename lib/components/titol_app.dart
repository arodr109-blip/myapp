import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/colors_app.dart';

class TitolApp extends StatelessWidget {
  final bool midaGran;
  final String text1, text2;

  const TitolApp({
    super.key, 
    required this.text1, 
    required this.text2, 
    this.midaGran = false
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Padding(
          padding: const EdgeInsets.all(3),
          child: Text(
            text1, 
            style: GoogleFonts.lancelot(
              fontSize: midaGran ? 80 : 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: ColorsApp.colorPrimariAccent,

              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0), // Horizontal and vertical offset
                  blurRadius: 3.0,         // Blur effect intensity
                  color: Color.fromARGB(255, 0, 0, 0), // Shadow color
                ),
              ],
              ),
            ),
        ),

        Text(
          text2, 
          style: TextStyle(
            fontSize: midaGran ? 40 : 20,
            fontWeight: FontWeight.bold,
            color: ColorsApp.colorPrimari,

            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0), // Horizontal and vertical offset
                blurRadius: 3.0,         // Blur effect intensity
                color: Color.from(alpha: 0.415, red: 0.843, green: 0.329, blue: 1), // Shadow color
              ),
            ],
            ),
          ),
      ],
    );
  }
}