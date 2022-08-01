import 'package:cloud_firestore/cloud_firestore.dart';

class DisciplinaModel {
  late String? disciplinaId;
  late String tipoDisciplina;
  late String codigoDisciplina;
  late String descripcionDisciplina;
  late String cantidadCintasDisciplina;
  late int idDisciplina;

  DisciplinaModel({
    this.disciplinaId,
    required this.cantidadCintasDisciplina,
    required this.codigoDisciplina,
    required this.descripcionDisciplina,
    required this.tipoDisciplina,
    required this.idDisciplina,
  });

  DisciplinaModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    disciplinaId = documentSnapshot.id;
    tipoDisciplina = documentSnapshot['tipoDisciplina'] ?? '';
    codigoDisciplina = documentSnapshot['codigoDisciplina'] ?? '';
    descripcionDisciplina = documentSnapshot['descripcionDisciplina'] ?? '';
    cantidadCintasDisciplina =
        documentSnapshot['cantidadCintasDisciplina'] ?? '';
    idDisciplina = documentSnapshot['idDisciplina'] ?? 0;
  }
}
