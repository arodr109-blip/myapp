import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';

class BotoAuth extends StatelessWidget {
  final String textBoto;
  final Icon? iconaBoto;
  final Function()? accioBoto;

  const BotoAuth({super.key, required this.textBoto, this.iconaBoto, this.accioBoto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: accioBoto,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorsApp.colorOmbrejat)],
            color: ColorsApp.colorPrimariAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), 
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ), //BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textBoto,
                style: TextStyle(
                  color: ColorsApp.colorSecundariAccent, 
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 10,),
              iconaBoto != null ? iconaBoto! : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
