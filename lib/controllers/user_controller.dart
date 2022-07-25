import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController {
  var txtDatePicker = TextEditingController();

  writeInputDatePicker(DateTime date) {
    txtDatePicker.text = date.toIso8601String();
    update();
  }
}
