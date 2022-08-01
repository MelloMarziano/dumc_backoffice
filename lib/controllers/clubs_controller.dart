import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/clubs.model.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ClubsController extends GetxController {
  var txtZona = TextEditingController();
  var txtNombre = TextEditingController();
  var txtDirector = TextEditingController();
  var txtMiembros = TextEditingController();
  var isLoading = false;

  var dropdownvalueZona = 'Zona 1';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  Rx<List<ClubsModel>> clubesList = Rx<List<ClubsModel>>([]);
  List<ClubsModel> get clubs => clubesList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Clubes");
    clubesList.bindStream(getClubesSnapshot());
  }

  changeZona(String value) {
    dropdownvalueZona = value;
    update();
  }

  saveClub(data) async {
    isLoading = true;
    update();
    data['idClub'] += clubs.last.idClub;
    final resp = await collectionReference.add(data);
    isLoading = false;
    //Get.back();
  }

  Stream<List<ClubsModel>> getClubesSnapshot() {
    return collectionReference
        .orderBy('idClub')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ClubsModel> clubes = [];

      for (var club in query.docs) {
        final clubModel =
            ClubsModel.fromDocumentSnapshot(documentSnapshot: club);
        clubes.add(clubModel);
        update();
      }
      return clubes;
    });
  }

  List<DataRow> buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = ClubsModel.fromDocumentSnapshot(documentSnapshot: data);

    return DataRow(cells: [
      DataCell(Text(record.zonaClub)),
      DataCell(Text(record.nombreClub)),
      DataCell(Text(record.directorClub)),
      DataCell(Text(record.iglesiaClub)),
      DataCell(
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                //fixedSize: const Size(150, 40),
                primary: dumncDoradoClaro,
              ),
              child: Icon(Icons.edit),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                //fixedSize: const Size(150, 40),
                primary: Color(0xFFB00020),
              ),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    ]);
  }
}
