import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as keyEnc;

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

class UserController extends GetxController {
  var formatDate = DateFormat('dd-MM-yyyy');
  var dropdownvalue = 'Selecciona un rango';
  var dropdownvalueZona = 'Selecciona una zona';
  var txtDatePicker = TextEditingController();
  var txtNombre = TextEditingController();
  var txtPassword = TextEditingController();
  var txtUsername = TextEditingController();
  var isAdmin = false;
  var isActive = false;
  var noShowPasswordLogin = false;
  var isLoading = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Usuarios");
  }

  saveUsuario(data) async {
    isLoading = true;
    update();

    //data['idDisciplina'] += teams.last.idDisciplina;
    await collectionReference.add(data);
    isLoading = false;
    update();
  }

  showPassword() {
    noShowPasswordLogin = !noShowPasswordLogin;
    update();
  }

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

  encryptPassword(String password) {
    final key = keyEnc.Key.fromSecureRandom(32);
    final iv = keyEnc.IV.fromSecureRandom(16);
    final encrypter = keyEnc.Encrypter(keyEnc.AES(key));

    final encrypted = encrypter.encrypt(password, iv: iv);
    //final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return encrypted.base64;
  }
}
