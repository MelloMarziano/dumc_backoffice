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

class BanderasDisciplina {
  late String? banderaId;
  late String tipoClub;
  late String codigoFalta;
  late String detalle;
  late String evaluador;
  late String zona;
  late String club;
  late bool evidencia;
  late Timestamp fechaDelActo;
  late String camporee;
  late int cantidaCinta;

  BanderasDisciplina({
    this.banderaId,
    required this.tipoClub,
    required this.codigoFalta,
    required this.detalle,
    required this.evaluador,
    required this.zona,
    required this.club,
    required this.evidencia,
    required this.fechaDelActo,
    required this.camporee,
    required this.cantidaCinta,
  });

  BanderasDisciplina.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    banderaId = documentSnapshot.id;
    tipoClub = documentSnapshot['tipoClub'] ?? '';
    codigoFalta = documentSnapshot['codigoFalta'] ?? '';
    detalle = documentSnapshot['detalle'] ?? '';
    evaluador = documentSnapshot['evaluador'] ?? '';
    zona = documentSnapshot['zona'] ?? 0;
    club = documentSnapshot['club'] ?? '';
    evidencia = documentSnapshot['evidencia'] ?? false;
    fechaDelActo = documentSnapshot['fechaDelActo'] ??
        DateTime.now().millisecondsSinceEpoch;
    camporee = documentSnapshot['camporee'] ?? '';
    cantidaCinta = documentSnapshot['cantidaCinta'] ?? 0;
  }
}
