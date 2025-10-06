import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';

class ItemPlat extends StatelessWidget {
  final String imatgePlat;
  final String descripcioPlat;
  final String preuPlat;
  final Function()? onTap;

  const ItemPlat({
    super.key,
    required this.imatgePlat,
    required this.descripcioPlat,
    required this.preuPlat,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(imatgePlat),
          ),
          Text(descripcioPlat),
          Text(
            preuPlat,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsApp.colorPrimariAccent,
            ),
          ),
        ],
      ),
    );
  }
}
