import 'calculoA.dart';
import 'erro.dart';

class BLLcalculoA {
  static validaDados(Calculo calc) {
    Erro.error = false;
    if (calc.H.length == 0) {
      Erro.msg = "O campo da altura é de preenchimento obrigatório";
      return;
    } else {
      try {
        double.parse(calc.H);
      } catch (id) {
        Erro.msg = "O campo de ALTURA deve ser numérico";
        Erro.error = true;
        return;
      }
    }
    if (calc.B.length == 0) {
      Erro.msg = "O campo de BASE é de preenchimento obrigatório";
      Erro.error = true;
      return;
    } else {
      try {
        double.parse(calc.B);
      } catch (id) {
        Erro.msg = "O campo BASE deve ser numérico";
        Erro.error = true;
        return;
      }
    }
  }
}
