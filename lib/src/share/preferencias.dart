import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() => _instancia;

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? "";
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  ///set y get de la ultima pagina 
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? "home";
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
