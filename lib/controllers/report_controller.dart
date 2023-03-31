import 'package:get/get.dart';

class ReportController extends GetxController {
  var dropdownvalueZona = 'Zona 1';
  var dropdownvaluetipoClub = 'Conquistadores';

  changeZona(String value) {
    dropdownvalueZona = value;

    update();
  }

  changeTipoClub(String value) {
    dropdownvaluetipoClub = value;

    update();
  }
}
