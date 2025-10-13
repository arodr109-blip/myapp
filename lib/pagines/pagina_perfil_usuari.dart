import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';
import 'package:myapp/components/boto_editar_camp_perfil.dart';
import 'package:myapp/components/titol_app.dart';

class PaginaPerfilUsuari extends StatelessWidget {
  const PaginaPerfilUsuari({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorSecundariAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40),
          
              // Títol app.
              // ==========
              TitolApp(text1: "Savor", text2: "Sphere"),
              
              SizedBox(height: 40),
          
              // Àrea requadre amb foto.
              // =======================
              Stack(
                children: [
                  // Requadre.
                  Column(
                    children: [
                      SizedBox(height: 100,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsApp.colorPrimariAccent2,
                        ),
                        child: Column(
                          children: [
          
                            SizedBox(height: 120),
                            Text(
                              "Nom d'usuari", 
                              style: TextStyle(
                                fontSize: 20, 
                                color: ColorsApp.colorPrimari,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
          
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Stack(
                                children: [
                                  
                                  SizedBox(height: 20,),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: ColorsApp.colorPrimari,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.email, color: ColorsApp.colorPrimariAccent2,),
                                                SizedBox(width: 10,),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: ColorsApp.colorPrimariAccent2, width: 1),
                                                    borderRadius: BorderRadius.circular(40),
                                                  ),
                                                  child: Text(
                                                    "Correu", 
                                                    style: TextStyle(
                                                      color: ColorsApp.colorPrimariAccent2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          
                                            Text("Valor email", style: TextStyle(color: ColorsApp.colorPrimariAccent2),),
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.phone, color: ColorsApp.colorPrimariAccent2,),
                                                SizedBox(width: 10,),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: ColorsApp.colorPrimariAccent2, width: 1),
                                                    borderRadius: BorderRadius.circular(40),
                                                  ),
                                                  child: Text(
                                                    "Contacte", 
                                                    style: TextStyle(
                                                      color: ColorsApp.colorPrimariAccent2,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          
                                            Text("Valor telèfon", style: TextStyle(color: ColorsApp.colorPrimariAccent2),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    child: Image.asset("lib/imatges/pastel.png", height: 50),
                                    alignment: Alignment(0.85, -1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          
                  // Imatge fruita - Foto - Espai.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("lib/imatges/grapes.png", height: 50),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(1000),
                        child: Image.network("https://picsum.photos/200"),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                ],
              ),
        
              SizedBox(height: 20,),
          
              BotoEditarCampPerfil(
                textDelCamp: "Email", 
                iconaDelCamp: Icon(Icons.edit), 
                funcioDelCamp: () {},
              ),
              
              BotoEditarCampPerfil(
                textDelCamp: "Contrasenya", 
                iconaDelCamp: Icon(Icons.lock), 
                funcioDelCamp: () {},
              ),

              BotoEditarCampPerfil(
                textDelCamp: "Termes i condicions", 
                iconaDelCamp: Icon(Icons.book), 
                funcioDelCamp: () {},
              ),

              BotoEditarCampPerfil(
                textDelCamp: "Política de privacitat", 
                iconaDelCamp: Icon(Icons.privacy_tip_rounded), 
                funcioDelCamp: () {},
              ),

              BotoEditarCampPerfil(
                textDelCamp: "Informació", 
                iconaDelCamp: Icon(Icons.info), 
                funcioDelCamp: () {},
              ),

              BotoEditarCampPerfil(
                textDelCamp: "Tancar sessió", 
                iconaDelCamp: Icon(Icons.logout), 
                funcioDelCamp: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
