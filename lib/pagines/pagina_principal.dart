import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';
import 'package:myapp/components/item_plat.dart';
import 'package:myapp/components/search_delegate_cerca_principal.dart';
import 'package:myapp/components/titol_app.dart';
import 'package:myapp/data/dades_locals.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> with SingleTickerProviderStateMixin {
  // El with SingleTickerProviderStateMixin és pels tabs. Si no es posa, la línia 
  //    controllerPestanya = TabController(length: 3, vsync: this); dona error.

  // Use SingleTickerProviderStateMixin for a single TabController. If you need multiple 
  //    TabControllers or animations, use TickerProviderStateMixin instead.

  // Variable pel cercador/filtre.
  List<Map<String, String>> platsFiltrats = DadesLocals.llistaPlats.cast<Map<String, String>>();

  late TabController controllerPestanya;
  // "late": quan una variable no pot valdre null, però no es pot inicialitzar 
  //    fins que l'aplicació es posa en marxa.

  @override
  void initState() {
    
    super.initState();

    controllerPestanya = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    
    controllerPestanya.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        // Títol i característiques generals de la AppBar.
        // ===============================================
        title: TitolApp(text1: "Savor", text2: "Sphere", midaGran: false,),
        //centerTitle: false,
        backgroundColor: ColorsApp.colorSecundariTransperencia,

        // Botons d'accions de la AppBar (només en posem un, el botó de cerca).
        // ====================================================================
        actions: [

          // Botó de cerca.
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

              // Una vegada s'hagi pogut crear l'objecte (el retorna un mètode await), 
              //    comprobem que no sigui null.
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
        
        // Creem les pestanyes superiors de la AppBar.
        // ===========================================
        // Amb la AppBar, es poden posar els ítems de la barra de dalt.
        //    entre els quals hi ha una barra de navegació de la part 
        //    superior de la pantalla, amb l'atribut "bottom" (a sota 
        //    de la barra de navegació).
        bottom: TabBar(
          controller: controllerPestanya,
          labelColor: ColorsApp.colorPrimariAccent2,
          unselectedLabelColor: ColorsApp.colorSecundariAccent,
          //indicator: ColorsApp.colorPrimariAccent,
          tabs: [
            Tab(icon: Icon(Icons.food_bank), text: "General",),
            Tab(icon: Icon(Icons.local_pizza), text: "Italià",),
            Tab(icon: Icon(Icons.rice_bowl), text: "Asiàtic",),
          ],
        ),
      ),


      // Contingut de la pantalla principal.
      // ===================================
      // (el contingut és la pestanya que estigui seleccionada).

      // En el body del Scaffold, li passem un TabBarView (i definim les 
      //    pàgines a les que permeti navegar).
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: TabBarView(
          controller: controllerPestanya,
          children: [// Posar-hi les pàgines que volguem.
            _pestanyaGeneral(),
            Center(child: Text("Pestanya 2"),),
            Center(child: Text("Pestanya 3"),),
          ],
        ),
      ),

      backgroundColor: ColorsApp.colorSecundariAccent,
    );
  }
}

Widget _pestanyaGeneral() {

  return GridView.builder(

    // Paràmetres de configuració del la GridView.
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // Ítems per fila.
      crossAxisSpacing: 5, // Espai horitzontal entre ítems.
      mainAxisSpacing: 5, // Espai vertical entre ítems.
      childAspectRatio: 0.9 // 1 seria quadrat, < 1 més alt que ampla, > 1 més ampla que alt.
    ), 
    itemCount: DadesLocals.llistaPlats.length,

    // Creació dels ítems de la GridView.
    itemBuilder: (context, index) {

      return ItemPlat(
        imatgePlat: DadesLocals.llistaPlats[index]["url_imatge"], 
        descripcioPlat: DadesLocals.llistaPlats[index]["descripcio"], 
        preuPlat: DadesLocals.llistaPlats[index]["preu"]
      );
    });
}