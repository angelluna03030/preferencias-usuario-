import 'package:flutter/material.dart';
import 'package:preferenciausuario/src/pages/widgets/widget.dart';
import 'package:preferenciausuario/src/share/preferencias.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});
  static final String route = 'Setting';

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late bool _colorSecundario;
  int? _genero;

  late TextEditingController _controller;
  final prefs = new PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = Setting.route;
    _genero = prefs.genero;
    _controller = TextEditingController(
        text: prefs
            .nombre); // Mover aquí asegura que _controller se inicializa inmediatamente.
    _colorSecundario = prefs.colorSecundario;
  }

  _setSelector(int? valor) {
    // Cambiar 'int' por 'int?' para permitir valores nulos
    // Verifica si el valor no es nulo antes de usarlo
    if (valor != null) {
      prefs.genero = valor;
      setState(() {
        _genero = valor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ajustes", style: TextStyle(color: Colors.white)),
          backgroundColor:
              (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
          leading: Builder(
            // Usar Builder aquí
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.tealAccent),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abrir el drawer
                },
              );
            },
          ),
        ),
        backgroundColor:
            (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
        drawer: Menu(),
        body: ListView(
          children: <Widget>[
            Container(
              color: (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Ajustes",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: (prefs.colorSecundario) ? Colors.black : Colors.white,
                ),
              ),
            ),
            SwitchListTile(
              value: _colorSecundario,
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
              title: Text("Color Secundario",
                  style: TextStyle(
                    color:
                        (prefs.colorSecundario) ? Colors.black : Colors.white,
                  )),
              activeColor: (prefs.colorSecundario)
                  ? Color.fromARGB(255, 170, 170, 170)
                  : Color(0xFF191B31),
              activeTrackColor: (prefs.colorSecundario)
                  ? Color.fromARGB(255, 207, 207, 207)
                  : Color(0xFF191B31),
              hoverColor: (prefs.colorSecundario)
                  ? Color.fromARGB(255, 156, 156, 156)
                  : Color(0xFF191B31),
              inactiveThumbColor: (prefs.colorSecundario)
                  ? Color.fromARGB(255, 155, 155, 155)
                  : Color(0xFF191B31),
              tileColor:
                  (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
            ),
            RadioListTile(
              value: 1,
              title: Text("Masculino",
                  style: TextStyle(
                    color:
                        (prefs.colorSecundario) ? Colors.black : Colors.white,
                  )),
              groupValue: _genero,
              onChanged: _setSelector,
            ),
            RadioListTile(
              value: 2,
              title: Text(
                "Femenino",
                style: TextStyle(
                  color: (prefs.colorSecundario) ? Colors.black : Colors.white,
                ),
              ),
              groupValue: _genero,
              onChanged: _setSelector,
            ),
            Container(
              child: _textodecoracion(),
            )
          ],
        ));
  }

  Container _textodecoracion() {
    return Container(
      color: (prefs.colorSecundario)
          ? Colors.white
          : Color(0xFF191B31), // Cambiar aquí
      width: 20,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: _controller,
        cursorColor: (prefs.colorSecundario) ? Colors.white : Color(0xFF191B31),
        decoration: InputDecoration(
          labelText: 'Nombre',
          helperText: 'nombre de la persona usando el telefono',
          labelStyle: TextStyle(
            color: (prefs.colorSecundario) ? Colors.black : Colors.white,
          ), // Estilo para el texto del label
          helperStyle: TextStyle(
            color: (prefs.colorSecundario) ? Colors.black : Colors.white,
          ), // Estilo para el texto de ayuda
        ),
        style: TextStyle(
          color: (prefs.colorSecundario) ? Colors.black : Colors.white,
        ), // Estilo para el texto ingresado
        onChanged: (value) {
          prefs.nombre = value;
        },
      ),
    );
  }
}
