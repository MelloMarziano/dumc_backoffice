import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CamporeeController extends GetxController {
  var dropdownvalueTipoCamporee = 'Aventureros';
  var isLoading = false;
  var isActive = false;

  var txtNombreCamporee = TextEditingController();
  var txtFechaComienzo = TextEditingController();
  var txtFechaFinal = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Camporees");
  }

  saveCamporee(data) async {
    isLoading = true;
    update();

    //data['idDisciplina'] += teams.last.idDisciplina;
    await collectionReference.add(data);
    isLoading = false;
    update();
  }

  changeTipoCamporee(String value) {
    dropdownvalueTipoCamporee = value;
    update();
  }

  writeInputDatePickerStart(DateTime date) {
    txtFechaComienzo.text = date.toString();
    update();
  }

  writeInputDatePickerEnd(DateTime date) {
    txtFechaFinal.text = date.toString();
    update();
  }

  changeIsActive(value) {
    isActive = value;
    update();
  }
}
