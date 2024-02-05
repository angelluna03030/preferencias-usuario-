import 'package:flutter/material.dart';
import 'package:preferenciausuario/src/pages/home.dart';
import 'package:preferenciausuario/src/pages/setting.dart';
import 'package:preferenciausuario/src/share/preferencias.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenciasUsuario().initPrefs();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

final presf = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencia',
      initialRoute: presf.ultimaPagina,
      routes: {
        Home.route: (context) =>  Home(),
        Setting.route: (context) =>  Setting()
      },
    );
  }
}
