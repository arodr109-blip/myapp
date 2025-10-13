import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';

class BotoEditarCampPerfil extends StatelessWidget {

  final String textDelCamp;
  final Icon iconaDelCamp;
  final Function() funcioDelCamp;

  const BotoEditarCampPerfil({
    super.key,
    required this.textDelCamp,
    required this.iconaDelCamp,
    required this.funcioDelCamp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcioDelCamp,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(iconaDelCamp.icon), Text(textDelCamp)]),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          Divider(color: ColorsApp.colorPrimari,),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
