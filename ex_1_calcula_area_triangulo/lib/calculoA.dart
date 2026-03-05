class Calculo {
  late String _h;
  late String _b;

  String get H => _h;
  String get B => _b;
  String get area => ((double.parse(_b) * double.parse(_h)) / 2).toString();

  set valorH(String h) {
    _h = h;
  }

  set valorB(String b) {
    _b = b;
  }
}
