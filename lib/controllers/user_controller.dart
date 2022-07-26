import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class UserController extends GetxController {
  var formatDate = DateFormat('dd-MM-yyyy');
  var dropdownvalue = 'Amigo';
  var dropdownvalueZona = 'Zona 1';
  var txtDatePicker = TextEditingController();
  var txtNombre = TextEditingController();
  var isAdmin = false;
  var isActive = false;

  writeInputDatePicker(DateTime date) {
    txtDatePicker.text = formatDate.format(date).toString();
    update();
  }

  changeZona(String value) {
    dropdownvalueZona = value;
    update();
  }

  changeRango(String value) {
    dropdownvalue = value;
    update();
  }

  changeIsAdmin(value) {
    isAdmin = value;
    update();
  }

  changeIsActive(value) {
    isActive = value;
    update();
  }
}
