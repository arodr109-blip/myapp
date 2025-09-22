import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';
import 'package:myapp/components/boto_auth.dart';
import 'package:myapp/components/text_field_auth.dart';
import 'package:myapp/components/titol_app.dart';
import 'package:myapp/pagines/pagina_principal.dart';

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
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: const Color.fromARGB(90, 232, 122, 79)),
          ),

          // Elements de la pàgina.
          // ======================
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitolApp(text1: "S", text2: "avorSphere", midaGran: true),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TitolApp(
                        text1: "Ready your Savors",
                        text2: " and share!!",
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  TextFieldAuth(
                    iconaPrefix: Icon(Icons.cake),
                    etiquetaCamp: "Nom d'usuari",
                  ),
                  TextFieldAuth(
                    iconaPrefix: Icon(Icons.email),
                    etiquetaCamp: "Email",
                  ),
                  TextFieldAuth(
                    iconaPrefix: Icon(Icons.key),
                    etiquetaCamp: "Password",
                    esPassword: true,
                  ),
                  TextFieldAuth(
                    iconaPrefix: Icon(Icons.key),
                    etiquetaCamp: "Confirma password",
                    esPassword: true,
                  ),

                  Row(
                    children: [
                      Transform.scale(
                        // Per escalar el checkbox.
                        scale: 1.3,
                        child: Checkbox(
                          value: false,
                          checkColor: ColorsApp.colorPrimariAccent,
                          side: BorderSide(
                            color: ColorsApp.colorSecundari,
                            width: 2,
                          ),
                          onChanged: (valorCheckbox) {},
                        ),
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 16, height: 1.2),
                            children: [
                              TextSpan(
                                text: "He llegit i accepto els ",
                                style: TextStyle(
                                  color: ColorsApp.colorSecundari,
                                ),
                              ),
                              TextSpan(
                                text: "termes ",
                                recognizer: TapGestureRecognizer()..onTap = () async {
                                  // ..: Operador cascada: Per fer servir l'objecte TapGestureRecognizer
                                  // sense haver-lo de passar primer a una variable. El que es fa amb 
                                  // aquest objecte, és assignar-li una valor al seu atribut "onTap".

                                  /*final url = Uri.parse('https://yourapp.com/terms');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }*/
                                  //print("Clic a 'termes'");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                                  );
                                },
                                style: TextStyle(
                                  color: ColorsApp.colorPrimariAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "i ",
                                style: TextStyle(
                                  color: ColorsApp.colorSecundari,
                                ),
                              ),
                              TextSpan(
                                text: "política ",
                                recognizer: TapGestureRecognizer()..onTap = () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                                  );
                                },
                                style: TextStyle(
                                  color: ColorsApp.colorPrimariAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "de privacitat d'ús d'aquesta aplicació.",
                                style: TextStyle(
                                  color: ColorsApp.colorSecundari,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  BotoAuth(
                    textBoto: "Registra't", 
                    iconaBoto: Icon(Icons.celebration, color: ColorsApp.colorSecundariAccent),
                    accioBoto: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                      );
                    },
                  ),

                  SizedBox(height: 1),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Ja tens compte? Fes clic ",
                        style: TextStyle(color: ColorsApp.colorSecundari),
                        maxLines: null,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                          );
                        },
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: (){},
                            child: Text(
                              "aquí",
                              style: TextStyle(
                                color: ColorsApp.colorPrimariAccent,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
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
