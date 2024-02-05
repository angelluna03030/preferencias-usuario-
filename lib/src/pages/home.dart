import 'package:flutter/material.dart';

import 'package:preferenciausuario/src/pages/widgets/widget.dart';
import 'package:preferenciausuario/src/share/preferencias.dart';

class Home extends StatelessWidget {
  
  static const String route = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
        prefs.ultimaPagina = Home.route;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias", style: TextStyle(color: (prefs.colorSecundario) ? Colors.black : Colors.white,)),
         backgroundColor:
            (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
        leading: Builder(
          // Usar Builder aquí
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.tealAccent),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abrir el drawer
              },
            );
          },
        ),
      ),
      drawer: Menu(),
      backgroundColor:
            (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Color:  ${prefs.colorSecundario ? "Claro" : "Azul Oscuro " }", style: TextStyle(color: (prefs.colorSecundario) ? Colors.black : Colors.white,)),
          Divider(),
          Text("Genero: ${prefs.genero == 2 ? "Femenino" : "Maculino" }", style: TextStyle(color: (prefs.colorSecundario) ? Colors.black : Colors.white,)),
          Divider(),
          Text("Nombre usuario ${prefs.nombre}", style: TextStyle(color: (prefs.colorSecundario) ? Colors.black : Colors.white,)),
          Divider(),
        ],
      ),
    );
  }
}
