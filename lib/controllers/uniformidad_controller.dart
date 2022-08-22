import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/uniforidad_evaluada.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../models/camporee.model.dart';

class UniformidadController extends GetxController {
  var isLoading = false;
  var dropdownvalueCriterio = 'Selecciona un criterio';
  var dropdownvalueTipo = 'Selecciona un tipo';
  var txtTituloPregunta = TextEditingController();
  var txtPreguntaUno = TextEditingController();
  var txtPreguntaDos = TextEditingController();
  var txtPreguntaTres = TextEditingController();
  var txtPreguntaValor = TextEditingController();

  var tipoClubWidget = '';
  var nombreClubWidget = '';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference collectionReferenceUniformidad;
  late CollectionReference collectionReferenceCamporees;

  Rx<List<CamporeeModel>> camporeesList = Rx<List<CamporeeModel>>([]);
  List<CamporeeModel> get camporees => camporeesList.value;

  Rx<List<UniformidadEvaluadaModel>> uniformidadEvaluadaList =
      Rx<List<UniformidadEvaluadaModel>>([]);
  List<UniformidadEvaluadaModel> get uniformidadEvaluada =>
      uniformidadEvaluadaList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Uniformidad");
    collectionReferenceUniformidad =
        _firestore.collection("UniformidadEvaluacion");
    collectionReferenceCamporees = _firestore.collection('Camporees');

    camporeesList.bindStream(getCamporeeSnapshot());
  }

  fillData(String nombreClub, String tipoClub) {
    tipoClubWidget = tipoClub;
    nombreClubWidget = nombreClub;
    update();
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

  Stream<List<CamporeeModel>> getCamporeeSnapshot() {
    return collectionReferenceCamporees
        .orderBy('idCamporee')
        .snapshots()
        .map((QuerySnapshot query) {
      List<CamporeeModel> camporees = [];

      for (var camporee in query.docs) {
        final camporeeModel =
            CamporeeModel.fromDocumentSnapshot(documentSnapshot: camporee);
        camporees.add(camporeeModel);

        if (camporeeModel.isActivo) {
          uniformidadEvaluadaList.bindStream(getUniformidadSnapshot(
            nombreClubWidget,
            tipoClubWidget,
            camporeeModel.nombreCamporee,
          ));
        }

        update();
      }
      return camporees;
    });
  }

  Stream<List<UniformidadEvaluadaModel>> getUniformidadSnapshot(
    String club,
    String tipoClub,
    String nombreCamporee,
  ) {
    late Stream<QuerySnapshot>? query;
    query = collectionReferenceUniformidad
        .where('club', isEqualTo: club)
        .where('tipoClub', isEqualTo: tipoClub)
        .where('camporee', isEqualTo: nombreCamporee)
        .snapshots();
    update();

    return query.map((QuerySnapshot query) {
      List<UniformidadEvaluadaModel> banderas = [];

      for (var bandera in query.docs) {
        final banderaModel = UniformidadEvaluadaModel.fromDocumentSnapshot(
            documentSnapshot: bandera);

        banderas.add(banderaModel);
      }

      update();
      return banderas;
    });
  }
}
