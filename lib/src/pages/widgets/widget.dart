import 'package:flutter/material.dart';
import 'package:preferenciausuario/src/pages/home.dart';
import 'package:preferenciausuario/src/pages/setting.dart';
import 'package:preferenciausuario/src/share/preferencias.dart';

class Menu extends StatelessWidget {
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: (prefs.colorSecundario)
          ? Color.fromARGB(255, 255, 255, 255)
          : Color(0xFF191B31),
      surfaceTintColor: Colors.tealAccent,
      shadowColor: Colors.tealAccent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/app.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.tealAccent),
            title: Text('Home', style: TextStyle(color: (prefs.colorSecundario)
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),)),
            onTap: () => Navigator.pushReplacementNamed(context, Home.route),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.tealAccent),
            title: Text('party_mode', style: TextStyle(color: (prefs.colorSecundario)
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.tealAccent),
            title: Text('People', style: TextStyle(color: (prefs.colorSecundario)
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),)),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.tealAccent),
              title: Text('Ajustes', style: TextStyle(color: (prefs.colorSecundario)
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),)),
              onTap: () {
                Navigator.pushReplacementNamed(context, Setting.route);
              })
        ],
      ),
    );
  }
}
