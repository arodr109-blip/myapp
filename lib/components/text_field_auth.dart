import 'package:flutter/material.dart';
import 'package:myapp/colors_app.dart';

class TextFieldAuth extends StatefulWidget {

  final Icon? iconaPrefix, iconaSufix;
  final String etiquetaCamp;
  final bool esPassword;

  const TextFieldAuth({
    super.key, 
    this.iconaPrefix, 
    this.iconaSufix,
    required this.etiquetaCamp,
    this.esPassword = false,
  });

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _ocultarTextPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextField(
        style: TextStyle(color: ColorsApp.colorPrimariAccent2),
        focusNode: _focusNode,
        obscureText: !_ocultarTextPassword,
        obscuringCharacter: "*",
        cursorColor: ColorsApp.colorPrimariAccent2,
        decoration: InputDecoration(
          fillColor: ColorsApp.colorSecundariTransperencia,
          filled: true,
          labelText: widget.etiquetaCamp,

          prefixIcon: 
          widget.iconaPrefix != null ? 
          Icon(
              widget.iconaPrefix!.icon, 
              color: _isFocused ?
              ColorsApp.colorPrimariAccent2 : 
              ColorsApp.colorSecundariAccent,
             )
          : null,

          suffixIcon: widget.esPassword ? 
            IconButton(
              onPressed: () {
                setState(() {
                  _ocultarTextPassword = !_ocultarTextPassword;
                });
              }, 
              icon: Icon(
                _ocultarTextPassword ? Icons.visibility_off : Icons.visibility,
                color: _isFocused ? ColorsApp.colorPrimariAccent2 : ColorsApp.colorSecundariAccent,
              ),
            ) : null,

          labelStyle: TextStyle(
            color: _isFocused
                ? ColorsApp.colorPrimariAccent2
                : ColorsApp.colorSecundariAccent,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.colorSecundariAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.colorPrimariAccent2,
              width: 3,
            ),
            borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
          ),
        ),
      ),
    );
  }
}
