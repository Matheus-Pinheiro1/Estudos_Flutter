class Erro {
  static bool _erro = false;
  static String _mens = '';

  static set error(bool erro) {
    _erro = erro;
  }

  static set msg(String mens) {
    _erro = true;
    _mens = mens;
  }

  static bool get error => _erro;
  static String get msg => _mens;
}
