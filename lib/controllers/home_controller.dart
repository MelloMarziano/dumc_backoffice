import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/clubs.model.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/disciplina_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference snapShotString;

  var dropdownvalueZona = 'Zona 1';
  var dropdownvaluetipoClub = 'Aventureros';

  Rx<List<ClubsModel>> clubesList = Rx<List<ClubsModel>>([]);
  List<ClubsModel> get clubs => clubesList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Clubes");
    snapShotString = _firestore.collection('Clubes');
    clubesList.bindStream(getClubesSnapshot());
  }

  Stream<List<ClubsModel>> getClubesSnapshot() {
    late Stream<QuerySnapshot>? query;

    query = collectionReference
        .where('zonaClub', isEqualTo: dropdownvalueZona)
        .where('tipoClub', isEqualTo: dropdownvaluetipoClub)
        .snapshots();
    update();

    return query.map((QuerySnapshot query) {
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
    BuildContext context,
  ) {
    return clubs.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, data) {
    //final record = ClubsModel.fromDocumentSnapshot(documentSnapshot: data);

    return DataRow(cells: [
      DataCell(Text(data.zonaClub, style: GoogleFonts.poppins())),
      DataCell(Text(data.nombreClub, style: GoogleFonts.poppins())),
      DataCell(
        Row(
          children: [
            Text(
              'Disciplina',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return DisciplinaModalCreateModal();
                      });
                },
                icon: const Icon(
                  Icons.visibility,
                  color: dumncVerde,
                ))
          ],
        ),
      ),
      DataCell(
        Row(
          children: [
            Text(
              'Uniformidad',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                  color: dumncVerde,
                ))
          ],
        ),
      ),
      DataCell(
        Row(
          children: [
            Text(
              'Marcha',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                  color: dumncVerde,
                ))
          ],
        ),
      ),
      DataCell(
        Row(
          children: [
            Text(
              'Civismo',
              style: GoogleFonts.poppins(),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility,
                  color: dumncVerde,
                ))
          ],
        ),
      ),
    ]);
  }

  changeZona(String value) {
    dropdownvalueZona = value;
    clubesList.bindStream(
      getClubesSnapshot(),
    );
    update();
  }

  changeTipoClub(String value) {
    dropdownvaluetipoClub = value;
    clubesList.bindStream(getClubesSnapshot());
    update();
  }
}
