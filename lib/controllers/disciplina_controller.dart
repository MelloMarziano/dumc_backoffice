import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/disciplina.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisciplinaController extends GetxController {
  var txtCodigo = TextEditingController();
  var txtDescripcion = TextEditingController();
  var txtBanderas = TextEditingController();

  var dropdownvalueTipo = 'Cintas Amarillas (AM)';
  var isLoading = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  Rx<List<DisciplinaModel>> disciplinaList = Rx<List<DisciplinaModel>>([]);
  List<DisciplinaModel> get teams => disciplinaList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Disciplina");
    disciplinaList.bindStream(getDisciplinaSnapshot());
  }

  changeTipo(String value) {
    dropdownvalueTipo = value;
    update();
  }

  saveDisciplina(data) async {
    isLoading = true;
    update();

    data['idDisciplina'] += teams.last.idDisciplina;
    final resp = await collectionReference.add(data);
    isLoading = false;
    //Get.back();
  }

  Stream<List<DisciplinaModel>> getDisciplinaSnapshot() {
    return collectionReference
        .orderBy('idDisciplina')
        .snapshots()
        .map((QuerySnapshot query) {
      List<DisciplinaModel> disciplinas = [];

      for (var disciplina in query.docs) {
        final disciplinaModel =
            DisciplinaModel.fromDocumentSnapshot(documentSnapshot: disciplina);
        disciplinas.add(disciplinaModel);
        update();
      }
      return disciplinas;
    });
  }

  List<DataRow> buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = DisciplinaModel.fromDocumentSnapshot(documentSnapshot: data);

    return DataRow(cells: [
      DataCell(Text(record.tipoDisciplina)),
      DataCell(Text(record.codigoDisciplina)),
      DataCell(SizedBox(
        width: 500,
        child: Text(
          record.descripcionDisciplina,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      )),
      DataCell(Text(record.cantidadCintasDisciplina)),
    ]);
  }
}
