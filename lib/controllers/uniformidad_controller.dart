import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniformidadController extends GetxController {
  var isLoading = false;
  var dropdownvalueCriterio = 'Selecciona un criterio';
  var dropdownvalueTipo = 'Selecciona un tipo';
  var txtTituloPregunta = TextEditingController();
  var txtPreguntaUno = TextEditingController();
  var txtPreguntaDos = TextEditingController();
  var txtPreguntaTres = TextEditingController();
  var txtPreguntaValor = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Uniformidad");
  }

  changeCriterio(String value) {
    dropdownvalueCriterio = value;
    update();
  }

  changeTipo(String value) {
    dropdownvalueTipo = value;
    update();
  }

  savePreguntaUniformidad(datos) async {
    isLoading = true;
    update();

    //data['idDisciplina'] += teams.last.idDisciplina;
    await collectionReference.add(datos);
    isLoading = false;
    update();
  }
}
