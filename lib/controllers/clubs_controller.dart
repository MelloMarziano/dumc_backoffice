import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClubsController extends GetxController {
  var txtZona = TextEditingController();
  var txtNombre = TextEditingController();
  var txtDirector = TextEditingController();
  var txtMiembros = TextEditingController();

  var dropdownvalueZona = 'Zona 1';

  changeZona(String value) {
    dropdownvalueZona = value;
    update();
  }
}
