import 'package:flutter/material.dart';
import 'package:myapp/components/search_delegate_cerca_principal.dart';
import 'package:myapp/components/titol_app.dart';
import 'package:myapp/data/dades_locals.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {

  // Variable pel cercador/filtre.
  List<Map<String, String>> platsFiltrats = DadesLocals.llistaPlats.cast<Map<String, String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitolApp(text1: "Savor", text2: "Sphere", midaGran: false,),
        centerTitle: true,
        actions: [

          IconButton(
            icon: Icon(Icons.search), 
            onPressed: () async {

              // Creem un objecte de tipus Future<T> amb el mètode showSearch.
              //    Aquest objecte ha de rebre el context i un objecte que heredi del 
              //    SearchDelegate (SearchDelegateCercaPrincipal, en aquest cas).
              final itemsSeleccionats = await showSearch(
                context: context, 
                delegate: SearchDelegateCercaPrincipal()
              );

              // Una vegada s'hagi pogut crear l'objecte (el retorna un mètode await).
              if (itemsSeleccionats != null) { 
                setState(() {
                  platsFiltrats = [itemsSeleccionats];
                });
              } else {
                setState(() {
                  // Si itemsSeleccionats és null, és que han tancat la cerca.
                  //    En aquest cas, posem els platsFiltrats inicialitzat a buit de nou.
                  platsFiltrats = DadesLocals.llistaPlats.cast<Map<String, String>>();
                });
              }

            },
          ),
        ],
        
        // Amb la AppBar, es poden posar els ítems de la barra de dalt.
        //    però també es poden posar els de la barra de baix, amb 
        //    l'atribut "bottom".
      ),

      // En el body del Scaffold, li passem un TabBarView (i definim les 
      //    pàgines a les que permeti navegar).
    );
  }
}