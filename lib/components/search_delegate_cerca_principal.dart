import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';
import 'package:myapp/components/item_plat.dart';
import 'package:myapp/data/dades_locals.dart';

/*
Aquesta classe és:
1) Heredà de SearchDelegate.
2) Fer el override dels 4 mètodes que van amb el SearchDelegate.
3) 

Escriure la capçalera amb el extends, i amb la bombeta, proposa implementar 
    els overrides de 4 mètodes (triar aquesta opció). Els 4 mètodes són:
        - buildActions()
        - buildLeading()
        - buildResults()
        - buildSuggestions()
    
    El extends és de l'objecte SearchDelegate.
*/
class SearchDelegateCercaPrincipal extends SearchDelegate<Map<String, String>> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ""; // "query" és una propietat de la classe SearchDelegate.
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, {"": ""}); // Retornem buit (null no ho accepta).
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final llistaResultats = DadesLocals.llistaPlats
        .where((item) {
          return item["descripcio"].toString().toLowerCase().contains(
            query.toLowerCase(),
          );
          // Aquest query.toLowerCase, és el que hagin escrit
          //    en el camp de cerca.
        })
        .toList()
        .cast<Map<String, String>>();

    // Retornem un Widget llista amb el que s'hagi trobat.
    return ListView.builder(
      itemCount: llistaResultats.length,
      itemBuilder: (context, index) {
        final item = llistaResultats[index];

        // Cada ítem de la llista és un ListTile.
        return ListTile(
          leading: Image.network(
            item["url_imatge"]!,
            width: 50,
            height: 50,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          ),
          title: Text(item["descripcio"]!),
          subtitle: Text(item["preu"]!),
          onTap: () {
            close(context, item);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Si no s'ha escrit res al camp de cerca.
    if (query.isEmpty) {
      return Center(
        child: Icon(
          Icons.food_bank,
          size: 100,
          color: ColorsApp.colorPrimariAccent2,
        ),
      );
    }

    // Omplim la llista que volem mostrar.
    final suggeriments = DadesLocals.llistaPlats
        .where((item) {
          return item["descripcio"].toString().toLowerCase().contains(
            query.toLowerCase(),
          );
        })
        .toList()
        .cast<Map<String, String>>();

    // Creem la llista a nivell visual a partir de la llista trobada.
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Ítems per fila.
        crossAxisSpacing: 8, // Espai entre ítems d'una fila.
        mainAxisSpacing: 8, // Espai entre ítems d'una columna.
        childAspectRatio: 1, // Igual d'ample que d'alt.
      ),
      itemCount: suggeriments.length,
      itemBuilder: (context, index) {
        // Retornem el widget que es crearà per a cada ítem amb aquesta funció
        //    que definim aquí. Si mirem el tooltip de "itemBuilder", mostra que
        //    la funció que espera rebre ha de tenir aquests dos tipus d'arguments.
        //    El primer és el context, i el segon és l'índex de l'ítem actual.
        final item = suggeriments[index];

        return GestureDetector(
          // Els ítems retornats són clicables.
          onTap: () {
            query = item["descripcio"]!;
            showResults(context);
          },

          // Ítem que construïm amb la info.
          child: ItemPlat(
            imatgePlat: item["url_imatge"]!,
            descripcioPlat: item["descripcio"]!,
            preuPlat: item["preu"]!,
          ),
        );
      },
    );
  }
}
