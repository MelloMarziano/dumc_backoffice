import 'package:cloud_firestore/cloud_firestore.dart';

class CamporeeModel {
  late String? camporeeId;
  late String nombreCamporee;
  late String tipoCamporee;
  late Timestamp fechaInicial;
  late Timestamp fechaFinal;
  late num idCamporee;

  CamporeeModel({
    this.camporeeId,
    required this.nombreCamporee,
    required this.tipoCamporee,
    required this.fechaInicial,
    required this.fechaFinal,
    required this.idCamporee,
  });

  CamporeeModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    camporeeId = documentSnapshot.id;
    nombreCamporee = documentSnapshot['nombreCamporee'] ?? '';
    tipoCamporee = documentSnapshot['tipoCamporee'] ?? '';
    fechaInicial = documentSnapshot['fechaInicial'] ??
        DateTime.now().millisecondsSinceEpoch;
    fechaFinal =
        documentSnapshot['fechaFinal'] ?? DateTime.now().millisecondsSinceEpoch;
    idCamporee = documentSnapshot['idCamporee'] ?? 0;
  }
}
