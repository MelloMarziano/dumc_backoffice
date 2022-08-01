import 'package:cloud_firestore/cloud_firestore.dart';

class ClubsModel {
  late String? clubId;
  late String zonaClub;
  late String nombreClub;
  late String directorClub;
  late String iglesiaClub;
  late int idClub;

  ClubsModel({
    this.clubId,
    required this.zonaClub,
    required this.nombreClub,
    required this.directorClub,
    required this.iglesiaClub,
    required this.idClub,
  });

  ClubsModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    clubId = documentSnapshot.id;
    zonaClub = documentSnapshot['zonaClub'] ?? '';
    nombreClub = documentSnapshot['nombreClub'] ?? '';
    directorClub = documentSnapshot['directorClub'] ?? '';
    iglesiaClub = documentSnapshot['iglesiaClub'] ?? '';
    idClub = documentSnapshot['idClub'] ?? 0;
  }
}
