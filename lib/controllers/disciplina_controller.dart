import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/camporee.model.dart';
import 'package:dumc_backoffice/models/disciplina.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplinaController extends GetxController {
  var txtCodigo = TextEditingController();
  var txtDescripcion = TextEditingController();
  var txtBanderas = TextEditingController();

  var dropdownvalueTipo = 'Cintas Amarillas (AM)';
  var isLoading = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference collectionReferenceBanderas;
  late CollectionReference collectionReferenceCamporees;

  Rx<List<DisciplinaModel>> disciplinaList = Rx<List<DisciplinaModel>>([]);
  List<DisciplinaModel> get teams => disciplinaList.value;

  Rx<List<BanderasDisciplina>> banderasList = Rx<List<BanderasDisciplina>>([]);
  List<BanderasDisciplina> get banderas => banderasList.value;

  Rx<List<CamporeeModel>> camporeesList = Rx<List<CamporeeModel>>([]);
  List<CamporeeModel> get camporees => camporeesList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Disciplina");
    collectionReferenceBanderas = _firestore.collection('Banderas');
    collectionReferenceCamporees = _firestore.collection('Camporees');
    disciplinaList.bindStream(getDisciplinaSnapshot());
    camporeesList.bindStream(getCamporeeSnapshot());
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
          print(
              'Estoooooooooo es camporeeeeeeeeeeeeeee ${camporeeModel.nombreCamporee}');
          banderasList.bindStream(getBanderasSnapshot(
            'Central Mella',
            camporeeModel.nombreCamporee,
          ));
        }

        update();
      }
      return camporees;
    });
  }

  Stream<List<BanderasDisciplina>> getBanderasSnapshot(
      String club, String nombreCamporee) {
    late Stream<QuerySnapshot>? query;
    query = collectionReferenceBanderas
        .where('club', isEqualTo: club)
        .where('camporee', isEqualTo: nombreCamporee)
        .snapshots();
    update();

    return query.map((QuerySnapshot query) {
      List<BanderasDisciplina> banderas = [];

      for (var bandera in query.docs) {
        final banderaModel =
            BanderasDisciplina.fromDocumentSnapshot(documentSnapshot: bandera);
        banderas.add(banderaModel);
      }
      update();
      return banderas;
    });
  }

  List<DataRow> buildListBanderas(
    BuildContext context,
  ) {
    return banderas
        .map((data) => _buildListItemBanderas(context, data))
        .toList();
  }

  DataRow _buildListItemBanderas(BuildContext context, data) {
    //final record = ClubsModel.fromDocumentSnapshot(documentSnapshot: data);
    print((data.fechaDelActo as Timestamp).toDate());

    return DataRow(cells: [
      DataCell(Text(data.evaluador, style: GoogleFonts.poppins())),
      DataCell(Text(data.codigoFalta, style: GoogleFonts.poppins())),
      DataCell(Text(data.detalle, style: GoogleFonts.poppins())),
      DataCell(
          Text(data.evidencia ? 'Si' : 'No', style: GoogleFonts.poppins())),
      DataCell(Text(
          (data.fechaDelActo as Timestamp).toDate().toString().split(' ')[0],
          style: GoogleFonts.poppins())),
    ]);
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
